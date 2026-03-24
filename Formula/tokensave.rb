class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from 13 languages"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b80a63b8b7f8eac0b0d5779c329b212f07fe0d6d9e93c13e177eb8e7fee57948"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
