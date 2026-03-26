class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "e6bc524b22e84e6073a4383ab89f033886c093f0f275c9a20ed6861e0db19772"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6994d288280458eb067ce48d772e57ddfbb6e3eb592c6017d02e80368fadea41"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e074d979eac6b50b1b384e9fb6baeac718b8669bbe751b917f066c13b66858fc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
