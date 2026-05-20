class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v5.1.2.tar.gz"
  sha256 "75aeb870329436f1ea6e11c7c1d28cb183028c37766d7ee366234a1d3b73972e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v5.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bfd678a8bd2dd646ab33859b4e5e7003de2b6ed8d50be6a53b0d6c2001a5bc24"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "63c4df488eb4ecd52316750239c0b60775e04e30f331e7f7088ecc9026eab040"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
