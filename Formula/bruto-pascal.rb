class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "700142a9d59026eb9cb4aa7548efea526c0df4de15d83b8d41f1483c7ff6e3f2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bd957d3cc61c384259dd597ea17f02bed63cca382dc559b26bef9e22a4603f0a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eac0d52241290117fd71a6d228bb2cad631bc5a1e68169805912d41e423f2915"
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
