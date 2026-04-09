class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.6.tar.gz"
  sha256 "bbc1202bb1578dda6a5292471b4fbdf1a888b78d82ba310b4f4fce1c5255cb8a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "815ef0af6ecb479bd933494b101c6c29af35c693179e0e394dc5cc0d9d3c3fa5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "181a236615a2ed3dd9531f208af4d994db183c0d934b3b707a0ae61196d2d1aa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
