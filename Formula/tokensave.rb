class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.4.tar.gz"
  sha256 "c2d983c5071342ebc6fafdeaead9ec349f129fa04882fbd330d32007be0d73ea"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0d5746c6196c9800a9dcb54ebc2f10d90efe8ceb5bb8222f9ab7b06bd38d67b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c0ff149ddca5212ceb7fb11d6a9268d26b70d536c89683d992b14340265ec0be"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
