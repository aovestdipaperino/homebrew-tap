class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.6.0.tar.gz"
  sha256 "e259756a02342ecd95a57ff6315895da07f3bc00e5456b68b437bc3cd57c76bf"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "83d5f4dd1874573f9a7a1e2bf232e73aaf8c3436589d0c99979d2cc227a24855"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7952bebcf2cf0e2bb8d8a0e9355c2d4dfee6b7a8141817ec6deb49ba1dcd2832"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
