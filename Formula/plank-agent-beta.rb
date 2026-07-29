class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.6.tar.gz"
  sha256 "f3b539ada94917587176719709afb8f704697e3c3d077eb4a840c2b117eb35e3"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a0d7460638d609a4ca1ed9cf8b0ff30b01446ed54a49843d74af599922e35493"
    sha256 cellar: :any_skip_relocation, sequoia: "5fce001989baa4805045d74412acf2e4b6716b260b24de738db2862c673522a5"
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
