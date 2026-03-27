class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.3.2.tar.gz"
  sha256 "c10a0056e1be3744e5cf1bc9a33918f29abaf7e9119f3cca4899eb3c74154114"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fcaf657c5ab5dc6e6b2e1a31a3c80ef41f29e94f8e2980471b90c9c68165fbfa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e0214f86bfb162004771d46ec09fe11acf4b89d312b157cc98aad7e2f745f87"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
