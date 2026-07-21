class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.5.0.tar.gz"
  sha256 "1b698a453ae81051472fadf85a3a8e09c9aea8d325889a439ae971a861855a63"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7dec075699b45631c2ec3faf7c8864630b5af7eda46c9c70bf1dcffc39267924"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2181e7c7ab346e63560a709b45f27b505f00e462d795aea8d9f28b8093fb4c6a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
