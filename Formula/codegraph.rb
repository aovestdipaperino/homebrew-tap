class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, Java, and Scala codebases"
  homepage "https://github.com/aovestdipaperino/token-codegraph"
  url "https://github.com/aovestdipaperino/token-codegraph/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "50c07c8d0e5d0220e9de7a1a728990a7fd74033ebe7f4c08fba7575c5bc89d51"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
