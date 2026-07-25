class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.6.2.tar.gz"
  sha256 "ccbd1a80c1bd1f2955fd3cb0757710b979109af8fe27104f56f67127b4704640"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.6.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "76ded6cd97a43d47ae080dc52aeb4c42eb441180b2435740494f8d24049cb321"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "417f495037360fa15aa8d7907f364a75d45645f1ef1b59e2b13f3a0458a0fa7d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
