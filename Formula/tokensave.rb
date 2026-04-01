class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "234a4b91c01a78a0c8af0d6e8e93c03e120ae115af660634bedd5781569dbeee"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2612ab59a00dd3d866260419e25aaf7116570b14cd276544bd9715f44aed2001"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d64484b7c5719c3be10ef57a215cb8668a66c93e4c05629fb5c0884c8e595166"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
