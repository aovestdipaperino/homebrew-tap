class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.4.0.tar.gz"
  sha256 "d959b77b0617a593ee6d5614d31c82f40622046edef6a16679dbd331446caca0"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a4199ba6adb304d5bfe4d4ffe9f4090a1b6467557b3300d74a58e1d37bcd254d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac297a57fe1a8cc79eaa8861635cd2612c5b23424373982fb7143b441e6b9b9f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
