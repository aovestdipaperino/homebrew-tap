class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "9b3794f2849dc5f803b0267ee0a57858b3e04a5511864da83790f97d5bc3d55f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7189cd1deff0d3d35e8e0c42b2c29e425c3b5b2d0629e2c9ff7042c8ccf3e9d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2a522fae2a4072e163fbf2e52b5ce85af088e1637e5f6f2b7b827b0dfa7cad48"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
