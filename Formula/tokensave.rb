class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.1.tar.gz"
  sha256 "eefb214dfeeb53c5130dc24dc30b593e758d27566d54e51c6339443849834bcd"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "983a9b28414690d3b0346a146d3eedc0a9d440fe3e41f6c156c0ceec72bab0e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a809cc1f9cb906adb4e1493750fb3eb6166aa06ce121e7ba1bc4c9543975dd1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
