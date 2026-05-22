class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.0.0-beta.1.tar.gz"
  sha256 "9382e864c1fb5bf2383a97e9ae508ca54b61716380caafb4c3f39d4b16bacafc"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.0.0-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b1c645e09da2c206aecdb28597a13276eb1065431670e4ce25202fd26c57cac3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "57d524c40cbf895bbb819ce174f04639196d5e9c7e91459ae41c051059792c2f"
  end

  depends_on "rust" => :build

  conflicts_with "tokensave", because: "both install a  binary"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
