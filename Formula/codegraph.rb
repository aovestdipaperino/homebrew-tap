class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/token-codegraph"
  url "https://github.com/aovestdipaperino/token-codegraph/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "08a360a8a036a5e6b6467daf926a6bfea72f70816494eb18c4f355d4651baee6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
