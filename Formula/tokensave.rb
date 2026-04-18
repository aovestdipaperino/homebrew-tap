class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.6.tar.gz"
  sha256 "25ea4189c2d1d65ddc2c757406470df58682120ae58ab40a7c1b11eca06e342d"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d638d0f52407aa3b27baaba97adb381a8203557db852b7e14f46d670bb7807b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "94415b47a92569e91f82552a0c4a31f1b20246d5a3eb4c33e235181f88c9cf35"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
