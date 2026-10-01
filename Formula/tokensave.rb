class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.14.0.tar.gz"
  sha256 "aa0ca42b8ded9c9751e7d9e3aa733cdc987f4e8b4f9872e8043c5c9fe22afeb1"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.14.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3e9f86de0699ad42081eddc89701b3e47fb23854f518ddb246cf13f84e5f289b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "11ae008d9813b4f0cbfb1e774ec5eb2ee0e2802eb1ce9e1ecb17b31cb8301349"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
