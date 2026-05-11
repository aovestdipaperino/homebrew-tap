class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.15.tar.gz"
  sha256 "1efa060549554f629e050bd9c7a3c6a4637c8f71b3cce55c1445fc91913f1567"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.15"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6d10f835ea8beffd9ff8ba3ceac3b550368b3d0d025c1a7694df5d6f09552142"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "35ec3e28d99ec1b03c4f3d3947e6ec5ea22cea4958e4c34cbad783d3bf46f8f1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
