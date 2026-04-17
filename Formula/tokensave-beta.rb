class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.5.2-beta.1.tar.gz"
  sha256 "ea33912f53c2d765816e3e7eb18f845e2538763e01003354376315fa05b62ae0"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.5.2-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a9a40cde7e4e2a35763a87f0310b1c642f79903017ae7272abef7917ac8abb56"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2cd1b15a0328d75ab22f2a07dca674e45aa415f5c45a04337ff98a6dbf0e25c3"
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
