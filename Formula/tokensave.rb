class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.13.tar.gz"
  sha256 "92d25cc767619add3b38403104e613e6717fec7ecf666d33e479ec71f183ff81"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9ea25038896f0ee91a0a7b58e13b54bb19d7ba6063b722e798bd8cbd7f47ebd3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f118cbf9cdc20891ec9e56dc29c4b7fb369f468179e075f1fc05d7caf581354a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
