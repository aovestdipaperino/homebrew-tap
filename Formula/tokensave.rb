class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "f7b59fa33d09f030b90aaccbf2712184832c67e7b081ddd7611d736e5e711859"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fced1135cc162a5bf63c93b393242d6e131276685a1abe78ea2624a5a2cea68d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b4fcc11731c9dee3a8fa6c72ffafc67724a52d0d576380813c1e0f06f517b1b0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
