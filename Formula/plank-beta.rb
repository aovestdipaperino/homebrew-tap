class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "2ebcdef132c256b2880ce7912d88a850e473c135b36bf72647b75d114c948443"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4a61bad214ab43bf3bf74e701dd2a267b8849c04ea229885c8295e6cabc0de69"
    sha256 cellar: :any_skip_relocation, sequoia: "2132fa6588ba680e3f21f200cdfc518518c6b14c297b709f9675c56f8679d0af"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
    # Metal kernel sources are only present when building from a
    # checkout with the ds4-ref submodule; the GitHub source tarball
    # lacks them (EchoEngine-only build).
    (pkgshare/"metal").install Dir["ds4-ref/metal/*.metal"] unless Dir["ds4-ref/metal/*.metal"].empty?
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
