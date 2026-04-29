class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.5.tar.gz"
  sha256 "4c5c05c1820d2632f8a53cdcfe5afc9d45f91318a9f16f1e723247d10cfa453e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "878dc9a61bb1f0139057cd3608cce5dd304d907ef792e68adf218d62f093e6a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "092c3110d98eaefd47cea2e674a624743d6e3edd624148e01da733c826263b65"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
