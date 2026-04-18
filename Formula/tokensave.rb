class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.7.tar.gz"
  sha256 "ca20e09b2ec17e78fcec7ef1995143c44e4e16953d0e8ac8426a9852b35b3e9f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "336c6e7cc5e0895de21bbd513e79cd311472f2ad4f48f855524dbc6ba70a8c04"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0c3cf1ac557a4bb06ae57a8b3d2bc93e902470b26f20bc4964d0229b2c6522b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
