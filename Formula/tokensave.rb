class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.2.tar.gz"
  sha256 "5054f742e9888f593c7fbc5bf4cb6d20ff4458e2c02c1019ee3d4f811142c61a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "941aa43e282b78e8361ce05ca6cb91847476e4a07220a3ed8cc84968033cdf21"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6dca23a9c2c8ad2c6615cc82db0d2cfded74a0b72a8d33372873b95f4d27942b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
