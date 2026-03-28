class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.5.0-beta.tar.gz"
  sha256 "8b7da009bdd1fd15ba44e7407031d3163ad698396777d09afee97d258c97b60c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.5.0-beta"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5b3da8dee1e9328eee3de43e7db8ddbeaa40d2d1f3a659eeb456404dbbc5c243"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "df82469855607b2238bf5e17a95a8dd607464f81928894aefbce06fae8d78ff8"
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
