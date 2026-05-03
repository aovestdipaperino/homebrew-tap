class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v0.9.10.tar.gz"
  sha256 "7762e2c72e817cfc60810e6aa5c402b4b2c9955fb054dcd946c47050272ee5a1"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v0.9.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "687be6b211be8d2df37aacb5ee0feee3b1aaa472f69e3803effe5634aa702e7b"
  end

  depends_on "llvm@18"
  depends_on "rust" => :build

  def install
    ENV["LLVM_SYS_181_PREFIX"] = Formula["llvm@18"].opt_prefix
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/brutop", "--help"
  end
end
