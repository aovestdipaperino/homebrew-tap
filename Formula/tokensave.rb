class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.17.tar.gz"
  sha256 "89e1e493cc98e1db3518824c5506c354d885c24b6d590dc2a8c593f6e84e382e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.17"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "96a8b2ae8b936cc31717151a2761967e0841bf9aaecd1d8acb026b36c6cd7db0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1ef48abf5fc353ac15391b6327e85cbd2943bfd4aeaba0fdab42393983617a7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
