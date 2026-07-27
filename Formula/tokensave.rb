class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.8.1.tar.gz"
  sha256 "f6b6f916b0810af3b4b2f539b582ddcbbcb9856317fa7f870eb8b372bf2b8641"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.8.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a9fec4b8b3dd96878b4f1bc65c7e88e70a15a419fc622776f1cafa01032e5d47"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cd01d744a6c6013febf53c993c011f48ce629af791c080d0d0616e4e33bb7271"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
