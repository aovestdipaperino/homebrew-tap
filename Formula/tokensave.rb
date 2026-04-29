class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.6.tar.gz"
  sha256 "9bb05b253934f8fe7a2ef5bb09197aa68e85b40f8af0f3cee765ece4506f4467"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c0932148f58a3086effb41e0f2d8679311ae839ecde45a9d4be557bdc891a8b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1298b0377bb194d1053638608b17e27e1959b797654e7e182741e18d9be15df1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
