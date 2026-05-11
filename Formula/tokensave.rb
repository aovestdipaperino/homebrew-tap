class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.16.tar.gz"
  sha256 "5518927d85a5cb5b5572ebace5b102ecf0bc5240b9362fbb9b3285e34561a340"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.16"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5f91afb9f3cf463d702304b380b6b2f5cb2385122a36fd887e4dc2aaa3c69fc9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4104e00ae6c7f66648db84e5f786f65676c7216a13b2baee31df4d7f943f1a2e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
