class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.3.tar.gz"
  sha256 "0659a18cbbd54543e58e856fb3a0841446d6b95f3ad2ef1de42a419650970805"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f3fc3f587a62b8844ef6f02cae5d8c07ce003d0df1315af6244c33c10b3cdabf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "623f7aa163bf2bc914b9d225da23cd3529997d7d1d5c3512d2803711b6c06a6e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
