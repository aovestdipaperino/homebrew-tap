class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v5.0.0-beta.2.tar.gz"
  sha256 "45eb7f6d1ca2e78af0479e5905f234cde79c725eb01933e9b7cde8a348195e42"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v5.0.0-beta.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "772d27340dfadc026d729ed05533da3e21f586009d876499a1b4747a8555d968"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d6684348ebe5bc21f90fd5925216b18606a14cd9858ed0ba394b9ea948ae802d"
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
