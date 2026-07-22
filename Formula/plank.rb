class Plank < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "ff397673b8f7a8cbc4a63d43bc1e10c18297400c6ca39bcf3125fd076595f0dd"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d46a17bb75450ab46549febd44dee978bd2133bb11959355d235d4c448e10eca"
    sha256 cellar: :any_skip_relocation, sequoia: "64f9329da5db87f94af9d04a805823c07da96abb7f7ee4e9c39e3aef149d8bc2"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
