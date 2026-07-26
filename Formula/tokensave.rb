class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.7.0.tar.gz"
  sha256 "d8ee7ccc5f8cf1af4148e3c042de5ff58c87c28dc341e2098ccc50aacea57016"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c792812cad84f676960e43f123eed2d719891fe8428e86e925258352ec4c197a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e0bba805e23f07f9f05f8bed8479beea89506b2e4aa26d67f0eb1d6fee2e1a8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
