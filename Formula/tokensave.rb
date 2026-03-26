class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.8.3.tar.gz"
  sha256 "44c5b6da55d44b9a51cbd3fd0639702e29632a15341b9830c609e73742173355"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.8.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "efebef71c2b14d9f0c38c781194b48b5cc3d4ec7861156b5b0579ccc8a57bdf1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3eeb85b705f557f96a0cbdee9adaa298cc9731ddec9cf4c63c2e1f50e5837811"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
