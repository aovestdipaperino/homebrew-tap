class Oronzo < Formula
  desc "A toolkit for Claude Code sessions"
  homepage "https://github.com/aovestdipaperino/oronzo"
  url "https://github.com/aovestdipaperino/oronzo/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "2a76ac36ec0d31996ea42a6fc03aad9d2846a4dccabd6b44d06b3da8d0db967f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/oronzo/releases/download/v0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fc606c92cc75d16110e85fa23c1698461148469ce895416bd79b438582aaa279"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a83df24ff47edc7f3b26985f78fa06c13c4cf78ca2a1cd4a1348c1935187fb5d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/oronzo", "--help"
  end
end
