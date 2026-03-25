class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "1aea743e70f4c07f0cd863c9610d5f874ba190e2691bc3b8c8d409fb88e1b17c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "143e107b18dd4d76a5b295047e2c81e4bb01c1112b15e40c1bc6d219dd293b50"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4d3b44a77f9d0fbc8aafe26e0fd3343f60ecf255168c50e75e75f71b1f57f86d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
