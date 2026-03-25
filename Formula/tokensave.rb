class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "6d435e7726115a36838e99531708545cfa82f9641fabb151a159459cbe2e6265"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0456df74428bb53ac290d63b23d351594c9678eccbe9dcfe84440a12e1e71592"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5274d417c2145dfffd7464f079ed8b30800504ac8e23a546538ace8d9e82b309"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
