class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.8.0.tar.gz"
  sha256 "ad7b6095423533aa088adcb22a5aad8685bf4c8ae9f004eb5b7f1b9205414219"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7e793782b83cb95bbaebe64613c1596575ddaeb9d94bba86b9f58c38d19712a4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23e5f44b509cdaba4eef09b03a4d133b71c006d9c6df40a5797afa6d857ac068"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
