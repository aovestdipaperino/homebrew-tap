class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "700142a9d59026eb9cb4aa7548efea526c0df4de15d83b8d41f1483c7ff6e3f2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "54c443261f2fad15ce81421c41e53cfeaf444b47ad5be50aff6f07bfc6a94e8d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "613e3eaf7f2bfd60017b5c3402bbc575dfd71f412c8d59ac75b7f2babfabe060"
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
