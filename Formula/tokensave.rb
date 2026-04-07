class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.1.tar.gz"
  sha256 "532bf510628f2cf4a32d7f6e1c54e0e0de9c0d65b3d2ce4bd4eec968cbe8596c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d0227ce7ab10116c60dc025c39aa460167edca8c9fd92a6dda73dcd945944673"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c3f766934da0a0cded08bac63e33c52fc13b29f4113d0d9b63902d41ad96de66"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
