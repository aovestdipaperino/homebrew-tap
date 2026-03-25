class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.5.4.tar.gz"
  sha256 "9dccb3f0ffb35ddc16723ea473ca73d9824175fd1999cee55ee849f7b38d6e79"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.5.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "15a667dedac54dc8bb00f28e73d5763ea7439dd2b9ac30dda7b706149f4e9b90"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ac7c3ae8204063285a6cda302633d03af880de8358eb0cffd077d26befe5b35"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
