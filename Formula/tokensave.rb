class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.3.3.tar.gz"
  sha256 "a96b1a774cd7c72461ef91303d7e52fe69e7b6c1e2708a0e8ac24e19e701bf24"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5182a8a8bf933165dbc34f0589870317786493755e00eb11dbd169f31869da5c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f0c053de02f90842b059b79b5ec78193280c68d73cc5fef5a8dc1b300427a63e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
