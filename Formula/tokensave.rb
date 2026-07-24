class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.6.1.tar.gz"
  sha256 "d8dfbe8ff4fd585a39892a9af7e8184d9357aae7e41be04e4cbc87dea2d5079f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b53b8b19e612ffcda8e1951115efd39657a5bad5cec59964087f18d9941d1c77"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dfad39294e660bb909f7c79da2d5f10c93656a28f7d4fa43c70cfbefb518f28a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
