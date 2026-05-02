class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.3.tar.gz"
  sha256 "df87f85b15b52cc217374b79c84a23bc6858492ee0f620d59dbcaceea8e7d048"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b2d1910ac497e930113d6f788effe94588f649f5a6f9fd8535216bd552eace24"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c068379bf4ff5a2f788ed3d4d3e9fb64bcdf4d9f0f82b7c17a13e039056be495"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
