class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.15.0.tar.gz"
  sha256 "6cc001126adae9b3a950c654e7f5e5cb6372e94b707dc5e0ddd56ea624fdde0c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.15.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fc6379ad8913d1aa7fe01f1f545ddc220ae2d92f10b7695ed69f8139fd054cbb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "69d134256196cbe5d8b0c45b1e4cb78a271a29ce2ecbdc62b5aa3d77f6f0131f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
