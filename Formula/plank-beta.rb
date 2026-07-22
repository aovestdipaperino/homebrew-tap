class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.3.2.tar.gz"
  sha256 "8dc3f7e17a99f3eb34364c2b01bc7aea07df73b88d07300b09324b96a9c42be5"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7e77b900d9a4f649d485542f41176b73f8d8de42bc7954ce33ecdcd7ada19aaa"
    sha256 cellar: :any_skip_relocation, sequoia: "564a1e71fcce62642604c824857075f7f6c799c5958c60f39efc92e25dd530b0"
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
