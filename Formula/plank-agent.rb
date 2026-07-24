class PlankAgent < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.4.2.tar.gz"
  sha256 "7c1ceeff68e15fe47ce3276e69a6a17385a7286ba665ab8bce105b98a47b5e96"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d35b38408d8625b82b8c68a094893731097294d7795f0d6a32c9268b7cea4da7"
    sha256 cellar: :any_skip_relocation, sequoia: "55d21dbc824e5543d9bca81d1d37bbaa28b3cd31e9d8971e1556badf8cc175a0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
