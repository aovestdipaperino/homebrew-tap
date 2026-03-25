class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "c442efc1489b0b6db7ff95b77235ba7741958be4d609cd8307b164f87cad0eca"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b0671f938227a69b9309ba58d05c2609d60e0472a75861ab12f286d3066101e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ddbcd1c34e8df50c7976a6993990f9ba38e1e4fc993ff38648a1260d1232e9e1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
