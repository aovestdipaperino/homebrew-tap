class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.9.0.tar.gz"
  sha256 "0e580549953c27f6135664d8a3ac63ebb7ba3e3ec5a93bed6df1788e6c0753b9"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cfb4e2cc24668a6ba5de1526b837c85510ea3a9c2d1bbcbcb2854b6971abb8f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a9468f307dfa419ffa75071977f2b3697362026ad76720df5e6c3ee452e5d750"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
