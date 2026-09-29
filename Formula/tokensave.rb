class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.13.0.tar.gz"
  sha256 "e4ebb83fdf5fdcfe05328d7145df1fe20025e9fb5f193656bda6dd6686fad612"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.13.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c1bd8b4ed8b10cb4f7fac2b52b4fc62a563bc5d116d34c90e5cdb1af36879173"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7aa7603b9e73e47590dae142b4ed961d6faca12c9d791081232fd67fd8fe02ad"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
