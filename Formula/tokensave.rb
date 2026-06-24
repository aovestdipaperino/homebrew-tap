class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.0.2.tar.gz"
  sha256 "f89bb583371840d77fc91a2896c22412c151af6a032585d8c815612f3d715ca5"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "50b3879e688e5e7f6fcf9ea14ec108033cc214912b2f9498dcd0f9ef04321b99"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "523f99f05d714c24e0d0dc0750a5cb8518378fe0d22e327b53503049dbb1cf80"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
