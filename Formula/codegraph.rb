class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "690db42978b84e97123e620a208869727e47b8f6f0a5970acbd6ea56c451d357"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3a3929da25a3876720a3519bb59c5846a2269e09be699f541d4cc24b81b1884f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cf347bbc2a1ae1a820ebab90a4393578d3f3a17a619f35facdfe17c4a9726aa0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
