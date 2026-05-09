class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.9.tar.gz"
  sha256 "6d715e407eabcdd9d2684366be14661a11ccd5f7024f02d32daa4319ec31e354"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "27ef1a4604d77d0842b7c00b1b7a5ff29b946512762adae6ac4ca2902329aa8a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a98d8fb66e5bd32ee23e479bc9f621689ef350c49f0c419b298273566094045f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
