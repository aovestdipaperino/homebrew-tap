class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "40b8b54b457f817b642200bbb86d80044eaa61bbd400e3fc5bb3fce7198ae5ee"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "63fadff9299fb8758283f0179c9da198f933ae566f0df911254c2c850c6c4fa7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "624e6c04bf1b2bd5080649298f18f46228ad172280666aac21248ead33bdf801"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
