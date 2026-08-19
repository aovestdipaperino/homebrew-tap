class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.10.0.tar.gz"
  sha256 "b9034955133ad39fddca11d30d111eb1f08855c0071659331a6b63e3c55deaa8"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f1b6ec17d53cecf52b4114a840f59fbbd629601cb0a1cd65cbacf895980eb310"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e7e2b6340c4969c04b99324dbf2c18d845b9f97e9c0c61dcb60442b502a28405"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
