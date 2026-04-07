class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "504cc4a65c5f2be8f72e39bc83cb2227e1b70427b3643be0db49103413a573dd"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7b7a8aa1e02bd5fc675da71727c96f360234696adc24004d5ea3532b64b957a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "79a64b1f70057116870583feb0d5b6efb6fc9dcfb6e3cc9e33aad485f89ed600"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
