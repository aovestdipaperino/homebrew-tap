class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.5.1.tar.gz"
  sha256 "6d6ae39b9a13cf9443b852cf23f88b9e4ebdfd9835ff2d449b937473b1162c94"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bd2ee5d4cee99bd5eb69754a9333332b743c2eb002ecb35d91d1fb93d1dc8936"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "353e10b4cf6c832a1d0f80da50620179145f06a3732d1f2666292ae34b4d3047"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
