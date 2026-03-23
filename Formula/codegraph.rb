class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "a5bd82c6647925e90da13d1b5f940053f10672f117f5aba0b61dca15de98844d"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e152b9df75c8a2f07c10c7a3a64b2a228ffa2692f9f44c45a3c30c1a36a602b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7faf256eeec8d457b23810ea531e98a99aa5629defef438ce6d741c6127a6ac"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
