class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.0.3.tar.gz"
  sha256 "fa4c204ddad64ec4932117148432c9141a5449a50325f81dde99c358d43fa47e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "df039f2ed6d76dc098690db07479833890993622943679937005d90612c4317f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c240cd587fa606cfcbc9be54131d5745b1e548123445c524156defc1d57b221"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
