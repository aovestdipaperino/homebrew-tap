class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "109fb8a757c0912adb3b79cca6974edcf720a2c15e167ac2250c5571fbab8639"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "46283dce7caa001efa78fb156f0906460d18ec936f1776f66915ee527752da19"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "55ac012d3a0ec175d25d8256ef2ce8e18370de5cdce16559fe7217c4ea2a2850"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
