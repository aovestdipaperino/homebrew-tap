class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.4.tar.gz"
  sha256 "e796bb2b19a23e1c4b3364d717f5a08f6ba90f44ac6106886e5eb30db75f9d2f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a541c13a1a7e979ac2cdaaf3f4a9765a83d7351493e64b8fe8dad400ba546324"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f9b94c2a34cf30091728c8e3c715f5841c3d410e80ce43520a6cac722a621792"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
