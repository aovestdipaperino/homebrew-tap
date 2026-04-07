class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.4.tar.gz"
  sha256 "5d93d1a0ef07e1f06e931daee49793cdb9408344a0556786b315dc7ec654a67a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "71715ec5b291e4feb14e61a934010bb156f53da92dfda2b0bcf3a2d2e68088e1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e113be1b2fe00dcd6de60f0f322abcbc1e53b6bea3c98f1b750475483d147f30"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
