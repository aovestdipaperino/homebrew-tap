class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.4.1.tar.gz"
  sha256 "dd40e9fbc5b979825e1ba39538d0e2902d3ec1f629bc175f5ce6b7f0b44e2090"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b6868e33eaadd23be6c780f2c6bde656da8312362d0a699cff1ebe20736c6923"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3377becedb02b4d7be36e4333f9f67031538d61965c841363c4e0fa92e35d44f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
