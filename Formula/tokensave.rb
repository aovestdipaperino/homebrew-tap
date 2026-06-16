class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.4.0.tar.gz"
  sha256 "b2c65aa8d8939be9b6caf04b53f35616469a3aadddca84304ee3584458c056a5"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e58d99eb422ddcd52c4a3f70c66a53b0892fdd051312a0a81d26d1c6fc28ccb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "968c2771e856515e18a403f22f216a1fa44e1be52e4002297fb373be84fa9ff6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
