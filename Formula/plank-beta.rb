class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "8469971b14b307d37dcf992d7b5e259ab59f3c5fc5e561ec4ed4964302379be9"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "140b65c28df0042ce87852aab42f41298f14a2593fd1cc482cf50de7fffadc1d"
    sha256 cellar: :any_skip_relocation, sequoia: "6e1ba93eecd4eea77fbbcd954987e34ff9419e2cb7238e4d297aedf155cd1a2a"
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
