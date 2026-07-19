class Plank < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "0965c592a6a7aa5800bf60c1ac2a2e85c3b98dfa4cdd2ccf96de974801dc7ce7"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d6a87c7adfd953beededb984c1fd0cfb0e924f592e9114db112e60a361148ed3"
    sha256 cellar: :any_skip_relocation, sequoia: "e65c76e729cdeeb125985b909df6ddf9c85f2603c229164c38375eff3bb990d4"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
