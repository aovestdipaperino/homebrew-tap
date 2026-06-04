class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.3.tar.gz"
  sha256 "0659a18cbbd54543e58e856fb3a0841446d6b95f3ad2ef1de42a419650970805"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5135b4255f284f2d484aa28219b06480a5479a85421092af37b3df66e289bc03"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3b935a5e531479d777715861f56568c3f7ebfca6c92ead4a4f40e9a98fca3145"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
