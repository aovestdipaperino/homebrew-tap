class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.3.0-beta.1.tar.gz"
  sha256 "0c5c7245e773f8b1f05b84c0cb105663a8ac773397ecea7c33a24800565029be"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.3.0-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "37a863ab1db71346ee7fa519e3d549f9f9297ce266a24bf1961c5cce048d8f7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e325064e9e6ebc526f019dff0b01407a71ab7c96526fe7503eb8634720f33494"
  end

  depends_on "rust" => :build

  conflicts_with "tokensave", because: "both install a  binary"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
