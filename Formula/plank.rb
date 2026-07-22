class Plank < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "b1bd0a2f497d99624d5733657436108938ed0b1f32871aa8f050dc34e441c07b"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6f1e1a1368a2a6a60ec8fbaf9c72cf7c083c30b02d01d2bd83a9dce21ff4b125"
    sha256 cellar: :any_skip_relocation, sequoia: "12dc3507a868e7a6256569ed7077f8c73af3ed2398e2b5b1e5a59313abcaa81b"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
