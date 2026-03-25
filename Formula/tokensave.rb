class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "6a472061e4daa2ba25bf2900af8b9e0cd5e030f31e23d90f7f10c8f3862dcc7c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dca4748088fe70a4221c210ad343bdbc45eaead98c9612bf04bdf9190d53a206"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f1785350cccf639b0821c02ad9d1b59bad58e38b5e39bb6fa3c26f47d52e9cd4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
