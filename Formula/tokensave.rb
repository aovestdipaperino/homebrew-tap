class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.3.3.tar.gz"
  sha256 "da3623b17dba283cd328f379aabcb52a36489bda037e4081e0075b04133152d3"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2988152531cba4ebc6b99f12b61885146f4296629786bd8e59221c5e96937ab7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f6961ba61a3cc8e48d8476fb87dc505e034f0ce81f9315748831a726c3fd0edd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
