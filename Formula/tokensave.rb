class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.11.tar.gz"
  sha256 "fe4a5e256796a5b8d6c8d7cf9ddc33d8f6ccae461b3a717c911552ed807c09c1"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "318b8b17b55a0d16050b8e9bcfc2226555ca302f7355872a0a6182f792a63174"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a177c5b1e9616a652e9ff6d35b7945871493108d5c78f13dadd760bd60692c88"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
