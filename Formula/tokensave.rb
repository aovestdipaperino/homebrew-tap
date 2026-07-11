class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.2.0.tar.gz"
  sha256 "5fec4e3daf18c5707621d0d688a2a93bd279f53b1a5859c7c75250d722a88952"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ddad23c4729ae721530c23c835958ecb9e9bdb400c976d9738b3481b3a9ab5ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f9990dfc86f8033995f5fb5d4d1938d6e37d68a737bcac0eb86f4f8b47026d07"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
