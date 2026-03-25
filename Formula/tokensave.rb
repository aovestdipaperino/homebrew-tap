class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "b19b565b4642c25eda71f854b2ff0361e132fc8a454d34ef7a511360bd4b1776"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "93ee0dfd1c59c491858542781e5c493d7a13baca03664324e0152d284661cd95"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17e6fccf9c2531994f86fa32cbfd622ecb4440c39e8909c0000123f8b633701f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
