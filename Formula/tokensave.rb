class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "c65267eef2473b9cb86a0a8e546bdfffddcec9faa4be22a9a01b723712f9c7e0"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c2b60844a93299f9aec7bd2089e7218c192f721cbd40101a6242f97cb1277069"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f85b0c232f0e85f23d15ad6006328657a32ceedac60c01e85e2eeef451b3d657"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
