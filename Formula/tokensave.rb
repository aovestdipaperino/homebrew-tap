class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.17.3.tar.gz"
  sha256 "a82c11bbfd7115f65065cebebbe12b5baed3f2b28e0adbaed9ac886d59a8c278"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.17.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57a595212c06cec89c4f07272c9b6689b7800f160ffca89dcfaab58f54152b64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e29be603fd4978857a651003ee979f459e756ddc1cbef5b78b14c7a7c55f0b9d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
