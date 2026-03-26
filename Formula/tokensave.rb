class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "94faef76bdc4ed52a510921e7c14a7ab0ba4baddb5a36f466b482875ee57020d"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "65be292217170fa5b6a557f61b5b4fe2d97942b5bd8478f913326eae877566ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fc659a29c45810998f379ade07398fce8d74c90e41030f71ff38be53d7753fa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
