class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.14.1.tar.gz"
  sha256 "a43174767867789f7332f77799ccd1f29b5a42c3e8bd0ce04ec49c7d6cb44af8"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.14.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "11197ca9352c0ff3ef2f327cb8ce2da17f969c580692e41fe17b67e0d12af342"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3724befc523547de057f28fc6c7d88fd5ee506edd61ff4a79e0d8b5ce48ab3ad"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
