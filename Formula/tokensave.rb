class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.17.2.tar.gz"
  sha256 "4f8f648ebae053e87991eb47021f1466ca046723e584c841705c79602aadf31e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.17.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "89d9a9fdfd37c8bffaf9413d4c72099a5441ebf051cb5a8a6733cc530b1ba4ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fc9ad2ee6a45ab87c1e12424abf2bb226f35974c8426804e26af6460e6912506"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
