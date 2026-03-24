class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f2b8b7a9c2221e615ecbe44ca2a1f39cea7530a9b6ef65bfdb18a01a55ef1f8a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8f3b076527795e1e74f8ea0f05892f66154c806cf98cf7d8bb0b6359f2dbe0aa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4b434abf1936d75320f67926789d7456de97e8318d9f91aa5d8f9d536647c604"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
