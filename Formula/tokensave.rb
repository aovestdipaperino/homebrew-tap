class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.3.1.tar.gz"
  sha256 "8cf17530d8b91738d8254119972513d8ab57d871ae4879356c25b4b2a0b3584f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d2bf2da2ec50ff53e46ed58bab8031715b9c3a112a8ba1586bbb257d751116e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c0745cac6d8abd2f6e941b3e3315e7ba9c66dd5a180fde0d7168c773f1d465a0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
