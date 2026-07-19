class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "35d59b70eef5c5261339fea5b599f011615cd45b1bdca3a1764f253ee9da0a36"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e391bf3e879f01d181804f94a3a9d38970d92e6748d350082ea3f320f99fc451"
    sha256 cellar: :any_skip_relocation, sequoia: "0ad5f7dbf9aa7217e26ba616d82d6636511be9162cdeb872480a64b81372b124"
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
