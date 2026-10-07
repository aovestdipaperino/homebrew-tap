class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "98b3fed463b201195fdfb4608b07fc4f7c935369b8536346755dfd7bca6f93c2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v1.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0a4fe138a61cf50d8d604783b1526107d9f4cd3adb1f7dc1840bbb384f91ad2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4ee5f76b849ab336134d2c16df1965f683d6c28219279bb9abb7502671f2195e"
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
