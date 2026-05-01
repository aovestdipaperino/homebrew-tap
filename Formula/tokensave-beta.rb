class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.1.tar.gz"
  sha256 "8fcd9b49dbbffce5ee1d720946a4a0f868589275783c72b721d4561f5656a974"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b5e475a2cecd42a06b2f226ebac9245260f4ec8b788e56b74b35149ae19adedf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa21f448c679eb6b6a6bf9afc414d23fa88f4e1f977baf5f921321c7e30fbac1"
  end

  depends_on "rust" => :build

  conflicts_with "tokensave", because: "both install a  binary"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
