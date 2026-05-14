class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.4.0.tar.gz"
  sha256 "de9368ad6d79d57ed3170098f4540e74948a57e72bd0ea0a4a92bddf10397c26"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1a26bf1d79a907031a83a81b8ab3b523f21d828dd376a79bed6437d9cd43ef6e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "470621c0f2e80112ece03febd696f72998538552cb33d47d831d87b1af454b61"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
