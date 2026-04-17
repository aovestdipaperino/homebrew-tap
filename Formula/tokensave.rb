class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.4.tar.gz"
  sha256 "4dbc7f2249537806a0081bafb2718cdf165388b8aa57ab3b4f4178c9a7f2d39f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f66e4c1ed705ad2cbfc620d79ebb96521bd6e10a6a5b940cca2763edd62631e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "deabc007cccf6b9c008906112da94a3c2f9601e50804b9ac47afcedaafdd69dc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
