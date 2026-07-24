class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "54975d2b5b3ecbe013c0a346ccedb33a3f455ef82a69aa9f17dae61eda4c0710"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1db465f16073dfd924139e59875f943138e3f89517bb16b8c189da7ed2f7eb80"
    sha256 cellar: :any_skip_relocation, sequoia: "7b9f39be98c01da30b49008ab77b5cc87095789e39c1903da20d44ba3660c117"
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
