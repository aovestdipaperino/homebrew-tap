class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.1-beta.1.tar.gz"
  sha256 "5aaf838795cf5e206bfd55f68a505dfc1dcc46138fb73d757a9c67b068f428ec"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.1-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c2c7ca421212bd082df45b24a7bbc1a01ba298c3bf1ebc348060b4ebd3e974f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b5b77caa44638ea785c9bd32c2f1a33fe20cb70779d310fd206e2237cf3c3f0"
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
