class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0c4ed64d58e386baadb7354a125e2b709d1d28c3fc7c1ba1ef967b2ce1eed547"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e9f9d3bd5e4b6d9bea15a8681ee5fd288d7561218eb7071202cc7537e41291c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "817d3c04787954414238ada224483e1368cacce8c15a13ce45e731e737785b6c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
