class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "0c86ec21851b9391ca3f42e8ea45334393642769d7a5250027718e319cbd58ad"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.6.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3a9614f9043963be1c3a832cbb3ae2c15cc55dbfa8951a1c0b2c25c6f29f7a9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4056214b834ddf909d117d1912da16301aa7548fe29693be8ddf7a7e5b9fc257"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
