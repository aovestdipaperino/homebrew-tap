class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "f12ee50fcb1f4d4c9901853155623c1f278e2e6d72b33369f306f79d0b66b747"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "066c49a25e99639c9bb6f8cd746f5723d53887bbec7c0be0719e8bbd5980c593"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a8e930cabed55639afc0752536c71a2c29e729939c157a86d5b5577a3bbcf74"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
