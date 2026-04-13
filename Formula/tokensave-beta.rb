class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.5.1-beta.1.tar.gz"
  sha256 "d5ccdd32fe13629f7db03c808227cd8971f2b72a1df9f83d4913830a71b9eea4"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.5.1-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "30adbe8c4a4662ec71847bd27f09bb32f1c1a4435fe4b79d51bd2b1afbea4af1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aed0bf324ed570eb1ff701fb94669540b0622381ad50946a1cc6d6b34966c919"
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
