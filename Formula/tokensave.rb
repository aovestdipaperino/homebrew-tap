class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.3.tar.gz"
  sha256 "0659a18cbbd54543e58e856fb3a0841446d6b95f3ad2ef1de42a419650970805"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9965fd3c0de6069f7a61cd2a3a85c3d107ba21b3f907aa2a4241cabc379117bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "28173d54c6d65337ff0610bdae537caf2ca5b01a4548ecfabe6fb66a845bc5c1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
