class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.4.2.tar.gz"
  sha256 "7c1ceeff68e15fe47ce3276e69a6a17385a7286ba665ab8bce105b98a47b5e96"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "daf179b91a678ac3edc65f7198f11df7268a38b2b800d31841e155cfc7536be6"
    sha256 cellar: :any_skip_relocation, sequoia: "e42e0bedadc40336361a505d6899974515bd44157d4619e0839d38b487f22619"
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
