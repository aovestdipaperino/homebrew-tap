class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "13e0d5ba012575513b8d219e476561a0e82b0a2f5563e397899fc99cc3f30a49"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1e727309e87a83e9d2c72bdb941016dcff6ddb4785905c9b860ff33710e890fc"
    sha256 cellar: :any_skip_relocation, sequoia: "f95f5567b95bb0680b4cb93a96e999a01ea96847c95d4427707e4fe512c9fa59"
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
