class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.2.0-beta.3.tar.gz"
  sha256 "7646d2d4243e5cdd62b7db4ca1aa5e49c77b3b0ce4680f4b8aedef4e7d4f607d"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.2.0-beta.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3916b694b2e310aaecb41f624545ac322518d56312a89de918f37bb74baa9483"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c5613e8618a6662d240a71e17bcab4054963ed7973bc4f2a6477edefc0b31602"
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
