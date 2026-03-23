class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "af0b48dc42758b1535896a8d9980b4c5b9f933895ec263cf26bcba61339427d9"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b3c9c41ddd798e914072e0fa3a230f436180505f68ac79d8975d262d19ec33cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a62fb4b1075abdf9f392d8fb560d9a1b9624a8cce97a1411afe301c960833076"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
