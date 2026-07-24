class PlankAgent < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "ab50aa9433a70a4451b84973415ce4777b23c23d38d4e86c709bd601b2fd49ea"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1c060b355893eb16d82756959f78b9ab9bcdfe402e79c55f8c1ebf60da9e03d6"
    sha256 cellar: :any_skip_relocation, sequoia: "8798aa212c4b323334c0118341ff86fdb668ca7ff3fdcf7375ed994c5203489d"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
