class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "e6e0e5acc652b7b25bc69fce0c4836760744d8ae9e9d1074cf35e77343f4a4d0"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.4.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "55cee468252c7981478877217704ef34261966b69da0364e8ce95355b2f3e4fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0a10dc71bf0936b100434719801c5dc90d5d9f4b1d5638c24445e0664c15f2a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
