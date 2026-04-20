class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "bfd1aec3028758ef22f730c940b62c15b36a63c89c4bc8056ede13aa6a8f8f44"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "79a13733271847ab94f78280807cf15621102737de61ed78c603f201bc02cc56"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bedfcceb1b30154f1a47e74b5b167783a78f395945b5cda026c8bbe9218386e6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
