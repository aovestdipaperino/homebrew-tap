class BrutoPascal < Formula
  desc "TUI-based Mini-Pascal IDE with LLVM-backed compiler and lldb debugger"
  homepage "https://github.com/aovestdipaperino/bruto-pascal"
  url "https://github.com/aovestdipaperino/bruto-pascal/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "a57399d59d472c6927bbad139361e2767bdbde902798db5b16eba52e2a7f8075"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/bruto-pascal/releases/download/v0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bfb87ef10acbed83fdb424969ac0a36388b2ddceb239a7c0c48d48601c134eb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e56dc5ed6491642d3bc007c209f31da79bbc297ecdf16bb2e161953a1bf29d6d"
  end

  depends_on "llvm@18"
  depends_on "rust" => :build

  def install
    ENV["LLVM_SYS_181_PREFIX"] = Formula["llvm@18"].opt_prefix
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/bruto-pascal", "--help"
  end
end
