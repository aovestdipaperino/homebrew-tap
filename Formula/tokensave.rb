class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.14.tar.gz"
  sha256 "91de5e23a9997a19d8380e910420c11fdfaf72664dcdd5ccca560acc8fa68f64"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.14"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e0aa8024fd60b059c371d920503e828a6cd9adde7f44b502b36a3e0f3024e6b8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fbb74a95c3e138ee750dd236514f05dd27f1c0319c3c5577dfa0f5b5702a48aa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
