class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "7a8c439ecca5fb5e8444082385b0653be9bbc97eff7b06155779af2b6ff71eba"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bfa2a155f86062ce0daeaf2b1f8bc98dbc0bd82357c15ce517e18dda511bb54e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b729b413434229ef9b0be8570c6f0a52adcf185714d96fcd7c4394aedb5d8270"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
