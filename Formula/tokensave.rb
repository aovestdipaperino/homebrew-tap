class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.3.tar.gz"
  sha256 "e1143a43c81638ade463403fe8a3f8d7f844df70e88f1645fbed6a438cb666c0"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "98d8fa33087b1a2a5a27fa2150b343d7cdae8ac7ad1410f237f9557da7bf160c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9a931f4e7a374cdc0a22ac843580e9898a4a0ea6ec1d0c69f04b335311939f5e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
