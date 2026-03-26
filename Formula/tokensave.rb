class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "9f002c6dcb0729789703e62204574d9f64eb45f45c4cb6918f73bbde287d209e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "862e93b0c24fa80cc6823fc5cdbb7b6cba3b173e99595ad9e2f7a8a6ea4cc5a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b242c7c92ceb66bbe1c143aa6a6fe4be7f2ed012632ed67a7795fbc72035b5bf"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
