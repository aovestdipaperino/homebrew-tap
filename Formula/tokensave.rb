class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.11.1.tar.gz"
  sha256 "b5207ed29def2fa5c92c033a2e5d0eee44e1bf1bfa2dc325ecd6dcc3be860ca2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.11.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ce0d90685c9941fe9cd7d949477c011241f4ed041c3e0a480a219d1b452e297c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bc26912100eba2956c3585bfdaf938f3a42bf91538d154e2d8c206a0d4fa0646"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
