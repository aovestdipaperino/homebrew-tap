class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "e417a99d151003a3488eb3cd91a69fc6636552bcc65910fca2561f9ebf74dc70"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "56f28bdb6970405a9ab0fb8de4de4b9bd23854826748069d5d0e85a0512f3e71"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2ab2ab7d38acebff6c5c7e4b859609fdc70dadc6481756ef64345c68077a313c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
