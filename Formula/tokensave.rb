class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.3.0.tar.gz"
  sha256 "b3ca6ff08e665b42c7b348d274e5e1a3d6530129355d2b3bfa28471514722ce7"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "23ee9ad9521eda27e545632d3aa6f0ee9636981c4cb453add3d5d5b478329341"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "98ac2ba21c9916d85a74cc49a7dd2ba4ff28702763e485ceeb1608b10f4f137b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
