class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.2-beta.1.tar.gz"
  sha256 "42963e7b62837500d630930b00b5b9bbda2d31330780306b71257f122f089c9a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.2-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cf3ecb650ce0a9fe34524233c9eb374c6a8771d2f7262e860e29e263d8d00ef0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5bce004f4953b7ae2d452467ec8a6194dbd0b91b2d872726c61a303005e2a7e"
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
