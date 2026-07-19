class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d325af1d07538d7215d726ab1a14b7f6baf1ecee750b6ae781d9c39555647ff6"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "103ee3c6fedb621cc0806e8d7dd694b10260ed7f94388a48254cdfa97c04df07"
    sha256 cellar: :any_skip_relocation, sequoia: "19812fd826dd902bbebb2f319d20b7f09d2091157c5bada9571d3862b65f4088"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
