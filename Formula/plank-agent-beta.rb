class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v7.0.3.tar.gz"
  sha256 "dfe87163283fb83add30bf11e8b7a287ce523c66a59be42b7a6813ae09be326e"
  license "MIT"

  depends_on :macos
  # arm64 only: the ds4 Metal backend cannot run on Intel, so a source
  # build there would spend twenty minutes producing a binary with no
  # inference engine. Refuse up front instead of shipping that.
  depends_on arch: :arm64
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v7.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d779fe7f2316add799153ebd10dbb42337e65b83566f48d6109d09c2006c9b39"
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
