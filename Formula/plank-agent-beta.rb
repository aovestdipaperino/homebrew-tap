class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.8.3.tar.gz"
  sha256 "669336c8b3f62049f55213101bffc266a00268ca0448c569ea1ccf605e0a681a"
  license "MIT"

  depends_on :macos
  # arm64 only: the ds4 Metal backend cannot run on Intel, so a source
  # build there would spend twenty minutes producing a binary with no
  # inference engine. Refuse up front instead of shipping that.
  depends_on arch: :arm64
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.8.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "74911ca6565c160523be54cb78b33f9ac1879e4a1e3cd058c91282786611fc44"
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
