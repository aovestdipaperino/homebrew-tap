class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "3b0ff1e939420227f1631535e87baade28781c6ecb47c907fc6aef4f327f7f43"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
