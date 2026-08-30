class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.11.0.tar.gz"
  sha256 "785d2eda4caad8113d0c3924a5b6dc0d87a61a270c0b603e40337aee98125514"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.11.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "33d7c0fa8885d25ca1f901208e590b29cc3814842f696c5339a312166b3a85d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4140bafa3ce35a7dc7b20065bccff9a54ef4b91158ecf85b03e8dc6417b8e04b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
