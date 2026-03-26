class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "23dda31e41c41354eba5e5719e5b712fc8e4a59e94697a3d3bdf0d978aebcb9c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.8.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "be24bab1ffeeee3149a888f5e0cbb61699cc3b9f9c9c17537e1b0e43f37f33ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1cae0884f3f6bbfc6e85bad1db158546ef25b2deeb6464d791b06e90d8bdd1ae"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
