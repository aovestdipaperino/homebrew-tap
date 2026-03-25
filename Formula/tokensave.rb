class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "4a485c1df5c59b00d81306577ad3c1ae8e6efe5e776c4856ba11db7a6e4587bb"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3b8ebb240c8fd1f17de955eb269e33fb6ce0272f1cd9e2967ff05a18e9edc9b9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a94b281692fc058e3a0743904f6f5abfced1b9f7b86d23f72e1fc372a7a28cd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
