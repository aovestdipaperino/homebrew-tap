class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.8.tar.gz"
  sha256 "a623910eb437d0cce807da252c7ec456bdd17c358d23dd312cb5ff2b02bd7132"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2c484fe0d95dd691eb348f56b92d20be9b3c186c03e6f56cdbc69cf0b0c1b219"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "68be37d5782da9aaae44728f56aea2d8053383dd8f7efa8ca96b10c47ac722e8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
