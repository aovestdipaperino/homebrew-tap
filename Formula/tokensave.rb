class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.12.1.tar.gz"
  sha256 "d0eee8419ca953a6b9a1320a01c56cb30d76689dc7fcf95aa3f787ce9212e731"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.12.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4aa8ce34a0c6967709d18d3737443f2c81e90b0864eefd162a4b8f626d5b3b9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b63fc082f0d3995321d6f2d99b7c9aacc52d90c993fc649cbfe923a9e00e85a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
