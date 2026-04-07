class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.3.tar.gz"
  sha256 "b9bf6a7bf54cfe65a766185ac2145dd251915ceabc58074320bda47f781e6abc"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4c6a93eb77630517a898cb2c7538abf03badaee215ee39612ce9d0d12d49b950"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f045f1e79c97f6c02e4523a882001b635de7dbfc8de37963098c7185afcf5421"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
