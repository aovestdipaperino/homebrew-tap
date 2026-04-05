class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.0-beta.1.tar.gz"
  sha256 "350c52b18f6a3f52700cfc3ca76508c81d90bf6a289d20dcbb1edcb8f05faa41"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.0-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "34c80787053d8b8089e625e308f11603d8ebc36e928f602d333fbdf2d4386d67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7fd9b5725c0bfd191c6cdb85e3266194d3d8c6f1d5cc46e93765951ed7d55b79"
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
