class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "c1c2232c6cc9667629580a274b3056ab938f3fcc05fb6520233d434eb72fbae6"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.7.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6d5ee497a449999fb02ac6316f34af5ed8743884b0e6d7f67afbdf86266af602"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "308d84c249bd79b1de1f094fb1df389b8fb467974c99743650821a0f402daa39"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
