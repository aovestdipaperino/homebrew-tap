class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.5.0.tar.gz"
  sha256 "4972e21cc8b9297bfa6638e1407b3292c9bccdc2730775ce756b149311680a9a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b7b587299075a9be750da27a187ac6f5c761ea14b45fa9e1d6c468ed9985ad63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "95b74dcd743e1c46a09b5346cb0880b4eff78bdeb59290da1105b2b83062a59a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
