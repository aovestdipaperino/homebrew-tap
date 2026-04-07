class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.0-beta.1.tar.gz"
  sha256 "4a5300fa40d5c6d05bc55982e9a922c448e79229a901faf832c2d93a4c22fc8c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.0-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9e35252fb18a0869e0c94011f54dbf04ee9864682b8f3e48fccaba2fb7a380cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb3523bd3b3f3309fe73bc12f51aed93202cf4aceed14b7435b45b125d8c5c93"
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
