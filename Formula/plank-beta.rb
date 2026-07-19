class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "3ef7f19a591db9e0c242500a91ac2ea735d941da18ddb4f737196f614b7b1f10"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fd0241664947fcd2a93e9e54ed23fbc7fea65a41ddb2da5e592e57e51b1f8b2c"
    sha256 cellar: :any_skip_relocation, sequoia: "83876dd1718e927956d5f569f07db6f1565f324e0841f95fac0f0af68eb7721a"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
