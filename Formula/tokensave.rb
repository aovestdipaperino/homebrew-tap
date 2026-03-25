class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.5.2.tar.gz"
  sha256 "fdb9bd79fc63a6c42df5c0cecd6c5f8d8818bd56b371aa053d194aa340afdb09"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "20901e8cd76fc90b2b8e115821e3d9075606eafdb8303529ebee7d68d5006a40"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8007e2a184d792fccec9a90970d15056c61bc348dee6d32f086606c06ea63dd5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
