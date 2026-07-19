class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "0c422c71dbe6d5601409ed04576f3c55174a90a3750a405d692c5002c4c97df0"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fe6ecd2f7970ed45969a9b6835cefb141f78bb049bbc74ec8d9c5ce940058be5"
    sha256 cellar: :any_skip_relocation, sequoia: "71db6feda16aedf15fac5878f8ac22435db9e677593a374498fbf1c8f4afae1b"
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
