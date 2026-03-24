class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from 13 languages"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "df2abc0bd628123838dab821036ee6ece150223c15f24695afc49c8eabf5dd22"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
