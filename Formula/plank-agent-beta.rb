class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v6.2.1.tar.gz"
  sha256 "ffeb1b56198c8fe7f1984a04a87e5523cc2a024bfb57cc9a31752411915cf152"
  license "MIT"

  depends_on :macos
  # arm64 only: the ds4 Metal backend cannot run on Intel, so a source
  # build there would spend twenty minutes producing a binary with no
  # inference engine. Refuse up front instead of shipping that.
  depends_on arch: :arm64
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v6.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d424e9f3a9dca85d693ce3ed89c703efab0c08f9a37cd34f497282caf91ca675"
  end
  conflicts_with "plank-agent", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
    # Metal kernel sources are only present when building from a
    # checkout with the refs/ds4 submodule; the GitHub source tarball
    # lacks them (EchoEngine-only build).
    (pkgshare/"metal").install Dir["refs/ds4/metal/*.metal"] unless Dir["refs/ds4/metal/*.metal"].empty?
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
