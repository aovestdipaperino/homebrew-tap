class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.1.0.tar.gz"
  sha256 "2667a79b14c3d88867a7c5a4b181b3af81479e7538c3b5316f8b6bdcbfd43848"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "521a74d122741b81f3d129c521d2c5356889f63f29a6917fc8656532f726672c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65223b64a21c17220a440a4c4a7e66e01ca19ee473dbdca0979d4a2a312f5e80"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
