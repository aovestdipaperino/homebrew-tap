class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.3-beta.1.tar.gz"
  sha256 "18976da5c19b30f70cce0aa85e8f654efe0baac9dbe4ab08b5551934cef7c35a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.3-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c9bf7f04d1623f66af88fda076605a20acd6a9b752b04dae6de79384c13dcd7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1c64435a1c23d828c3e6d46c7098e0dd1a44cb1f47712d43b97c873ed3fe6c6c"
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
