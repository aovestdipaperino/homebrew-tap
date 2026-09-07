class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v4.4.1.tar.gz"
  sha256 "a88757c6d005d246858061a32105417531f8ce66a65e5b66b9bdb434d007158d"
  license "MIT"

  depends_on :macos
  # arm64 only: the ds4 Metal backend cannot run on Intel, so a source
  # build there would spend twenty minutes producing a binary with no
  # inference engine. Refuse up front instead of shipping that.
  depends_on arch: :arm64
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v4.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ade0ba598993f42f993e163851dd4ab16740b464dde182a0fb14d9ae56601d02"
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
