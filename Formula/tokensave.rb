class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.3.0.tar.gz"
  sha256 "b8f382652de16960c46d2f7c249880104be0d372a394ad24f6e28083da266ccc"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "94bc268bf4c54dc028e7bee148d3bd96e17d1e553454f2357e7373770b1437b8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5da92ceb2fa49eaf7359d9673990d8ca4e731dd386859d03060b4760380f8f7a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
