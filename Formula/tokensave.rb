class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.4.5.tar.gz"
  sha256 "78b3e638cd963305d278e390c2e1f7cf3a2e44f4e90e74a29ff90212fe98c836"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.4.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4085843ab85887fc1902c3e576b77c61175d2621232f295f270505b3601b02ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f7f4930fad4a8f81ac1b67f6ac6c30e38bcb6744907fcef63b48ac603ae05052"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
