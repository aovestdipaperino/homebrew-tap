class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "ede536ec0b541201aff1e61e2d799e816f8e1a7ff0876c20a43c8eeefb8f42b0"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6589cd07f9764102a4a412c69c56455d1ee230f82450c351628e2a64f3190b3d"
    sha256 cellar: :any_skip_relocation, sequoia: "6cf1725636a9e75bbb742afaf3caac0cbcf83eaf4e990b8bfde4fea655180c17"
  end
  conflicts_with "plank", because: "both install a plank binary"
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
