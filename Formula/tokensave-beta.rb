class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.2.0-beta.2.tar.gz"
  sha256 "c9d0d21a8106ac2e4d35e3cd6634b741bf2eca5c883cba6a47ffd4c118c53e27"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.2.0-beta.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7bee4ef39215bfa56ec341871e5eafd31b0a41143724c69d7fb4cc760db44614"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cfbf6a846306d3df32403044111fa87c7e889a60db0b5ac1d981a238aedbd362"
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
