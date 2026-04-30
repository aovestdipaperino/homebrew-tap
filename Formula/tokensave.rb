class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "a652f98b45b75777a3bdfa3bd438d000b9f7ecfd146e2d4d5944aa38326da6f7"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c39051ff109fa71fe5ed8d58846dad15c56d681a0d8e98497b8a54b35c27d824"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2527624f12de9b0329bb924a22dad9618aa8e2925866fccfb69e438b9a9c5b49"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
