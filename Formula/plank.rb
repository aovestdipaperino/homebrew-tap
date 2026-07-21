class Plank < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "8469971b14b307d37dcf992d7b5e259ab59f3c5fc5e561ec4ed4964302379be9"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ff45b464e3e4f964aea3887f44c5535b7a4009998852ce00830b5a67a30bb4e8"
    sha256 cellar: :any_skip_relocation, sequoia: "a988e0ce53b4c6f9747371805176fd63ece51cee80ebbcd5d03a28c0358450c0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
