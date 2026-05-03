class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4eda684b7d94b3218f6af1b3a323a63b928c6c5d21ff906ace92ba1185bbb383"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5ce564e7faac66f34ba4efb5cc7f9e663dc1293b60cbde9e964ebdf0ea8b1978"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "afe7527865b6feff817e676fa4d1f8da0640a5c33b163d8f35fffb26415c39cd"
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
