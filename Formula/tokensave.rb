class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.3.2.tar.gz"
  sha256 "9a9a0cbe105691431cc8ca1329025315f75a51b2522b98a13c1243e7890f10cf"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1c647b29a10995f3799e2350c62d07f37f23e18f5500c2f955ff5f86c071b10b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52d3c81e96a2a2ccf6ed946b6a052d510eb3a1c4a26ad0677d02e51d2fdd442d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
