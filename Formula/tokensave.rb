class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "deaa262d879570f6dc08561d7dacee4c860b8eafe645ca94e167beada29b0708"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dcaab42ea24db5da076bcd41436b071fb8c580b92e1388f000d3f282ad7e6567"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f5bfea3cb096f36b6b431963639606121b788f4714a291329167cce3cdd376d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
