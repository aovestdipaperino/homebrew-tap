class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.10.tar.gz"
  sha256 "c80069e69e4a3322d359f2c3148088039407218c75535b037bb3f138cd3b8edd"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "05706ee5b20b9dfebce19bd23c8c6bd95f9db39666eb29c7ffbaf8afe1ce8d87"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9bb46e300c5e723b5668596972466a9f55eee7431caf2788837d7fdf95c3625d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
