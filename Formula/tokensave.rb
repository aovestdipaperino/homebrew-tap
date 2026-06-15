class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.3.2.tar.gz"
  sha256 "dbeba320a2996ecadc4fd3ddbef026ee366b2b30813d4603c35ccbc44379fb7a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b9985de4c1ed30cabd1753c2b06a8f65162507adcf14a11bcc03601b9bc9211b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "82bada9b9b5629031d98a61f5964c41e4958869136605bbf703bd1b61fae2f43"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
