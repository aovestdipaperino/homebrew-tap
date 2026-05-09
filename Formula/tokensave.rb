class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.12.tar.gz"
  sha256 "9237e36c1a0fb52d216d13bdb9dc9168afcf8c48bb9beb4673b5033b12bb710d"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "37ef7d418e806c6dc1f23c36f7660665500937497db2d1144023d86e8e96ea74"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0f4a18fac6f309b8fcb223f6411fcdcb62577ba0d93d62abde5340a70ddc510"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
