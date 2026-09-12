class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.12.0.tar.gz"
  sha256 "9a2cd59c0a732b7ea0b3d965f434d553081ba85bcf63e87a16328ba6724515cf"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: ""
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9179be4794c26b261365efeed6f8f3304ece62850801f682fd61cd4783e60256"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
