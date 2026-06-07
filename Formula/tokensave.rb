class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.4.tar.gz"
  sha256 "679fba0a0626f6a37a272abb368b30c7c41297b9f55b21a97f261394324fae8e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "78f3f6163c0f689a7e8b2dda806377f69e14f5630002659f81fe0bb0b8b8f0cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee834a6588168c47f6a36e03f6f6d29b2d13cb995d17ef1acda7a5a0aa26e9a1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
