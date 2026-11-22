class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.17.0.tar.gz"
  sha256 "e97c0c458dd9c606bd0380ed8fc2e2d3ab6021c6df37c94de1baae63b3c67584"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.17.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "927cceddecd418a0acf5571ca115df9cd36f68d657665ad55b1049c9894d1e5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "389d540b8b473a27ada201b4a352adf0e90e93fb0922116371f3a317b57d37dd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
