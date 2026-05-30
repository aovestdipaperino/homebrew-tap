class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.2.tar.gz"
  sha256 "ddd84cfb2151338677b81bb68e41dff6e646a4bc69b41d75fb5475a14e2e9282"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5674b1daf16ca08cabf657d140e5b5fde77275e2b23d0ced9063eb2c291f49f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5571c74debf62710fab5e048f15490215645022b90b958ec4ad35c9b368c3cb9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
