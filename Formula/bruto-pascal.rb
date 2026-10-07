class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "98b3fed463b201195fdfb4608b07fc4f7c935369b8536346755dfd7bca6f93c2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v1.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "66ca23cee7cc6a07f8a211cf6ec9e94b7b56a67d88cdd7a4d0d6063d6358c10f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "78fb84ca05610bd473ce95ddc1d663d3861e00d734ce1dec685e6ba93143b9f6"
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
