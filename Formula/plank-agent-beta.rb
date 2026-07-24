class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "ab50aa9433a70a4451b84973415ce4777b23c23d38d4e86c709bd601b2fd49ea"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "47ffd9d276efd557c1cf62a39465cd57e0acf42cba6da2696e0d6273f9b75d40"
    sha256 cellar: :any_skip_relocation, sequoia: "159881e21f1afa0170d9756d45ff29eeb84dec5d1fa1b43f770abfbe0d1158a2"
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
