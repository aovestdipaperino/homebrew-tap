class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.5.tar.gz"
  sha256 "37c0260920ae2954726083a5df5d38bf59a867f963e4cdd4e5f0b212414c1058"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fa3b69eff3a38135b006a2159495f7bf004b79d38519bf3b896bc3b7e83f0c35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "59ddead928317cb12ad8a58b0325aac38222884ab053e2ad61df576ae256ad99"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
