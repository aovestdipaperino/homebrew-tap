class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.0.0.tar.gz"
  sha256 "cc55e1cf100068d639cf4cb2a8a3b4d9af4c8a1c65ce0d4a63e8af1d9f4d12e2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e7b781972590bbb7a5cd6cf0dae0a5894943a81bc7abdc8b1992317924762ff0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "269c87102b83b97389a9efb58b143d3b054a47ac756e24ad63ad3d40f51ff82d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
