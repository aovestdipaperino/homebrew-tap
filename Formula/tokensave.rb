class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from 13 languages"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "35ec313f6e269567433da787d22fea59e08e37535da9a2c5495b13f54ae56d36"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
