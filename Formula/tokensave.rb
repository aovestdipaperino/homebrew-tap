class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.8.tar.gz"
  sha256 "4874a874189993cf6d08726b1e3a93b7e01923c16a3a3acc16759cbbd3e7222f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e8c162fa503f5c1344ca220157b92ee686205988ba29a9a5e623a4bc4403417c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8ed0f174c417b7a04e8d502018c689ba9547a72d114047d30f4c26ce739301f9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
