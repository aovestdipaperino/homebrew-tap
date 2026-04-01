class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "15d80b20e63f6a0dc0818a97d37338df05ce1f9968cd93e5fe152958556e687e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "720efc952f1ad31b8bb8b6f067f920469be65075c1724d9b982d7746f0f147d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7c3bb7f08f53a71f2cf7f66cedc0bf5c88fb5fdd8037bc36576125041a668aa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
