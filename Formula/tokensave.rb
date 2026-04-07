class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.2.tar.gz"
  sha256 "aca4242ab1cf7d2954bc4ac167d900b4abbb4cc74edb4ff8c72326f882ef0465"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8131fde861f95dc2a0cbadd1d40f6663ec02256fb06f784b01d281696db54ded"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "84ffffe5d6ad53aa2ee2f433414ec08626cfe071b1922ff6c77a1426757bff7c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
