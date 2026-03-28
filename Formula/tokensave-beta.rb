class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.5.0-beta.1.tar.gz"
  sha256 "c5f7459a86406819cd61969c123df6044c595337da4dfeed9277190053b7532d"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.5.0-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "28098fc5f8a2656c3f1c4ee037bc66fe72a4879fe92e90cf96315c3a8f2cd4ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "875409ca9b81eb8c599db8dd8e81a648a0c8a305a23c853f4fbaa7914628aa7a"
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
