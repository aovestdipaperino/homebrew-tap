class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.4.tar.gz"
  sha256 "9c3070bd623b5bb8ba7df7f553a6b8893c127128e29c83d6633c494ca779a80e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a91dbd5b23acaf92187debd0c4c5455bcb8417662458102176fa75b719b2bb35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0c724b8dca89382187492dcdf2fea59c8b7015b39bf4284369e1cb55f97ce01"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
