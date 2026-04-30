class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.2.0.tar.gz"
  sha256 "22492666e0321626997f0d85e51b4ac186bae3dc168719bdcc8e3e0a878d59df"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e713eebeab66bb4325b81931e2993f05d69646f970e03d01ed3626ef918c30e1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee7b42312249283792a8de7ae2c3c9a431057cb03980ac9ab02110664daab288"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
