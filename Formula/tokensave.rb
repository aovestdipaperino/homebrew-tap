class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.2.tar.gz"
  sha256 "9434e489b3530e7edfb92a1c5aea6a36d2696dc01fee82b0b9378696d1cc7a3a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "624c13e38e2f282b2970f0edd1f9e1d2fc9b8148d02b65acd267f6f5a8e00c19"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7e94a3b1cfb23c26953eba46577b059476996f3b73fd250647d5df41e7843fa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
