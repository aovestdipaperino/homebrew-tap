class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.5.1.tar.gz"
  sha256 "4752c003cc5f549e0f190b6528a0f2dc1f57ac23d0c3fbcbb63f947276db9c3a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "028b1be72f1795841d9829852c14793348f3829078dd451289e7ff6f06ac4422"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "91a97e42ebb731c7b8576e8581ef7af9ea310539464105aebd688fcb32065b56"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
