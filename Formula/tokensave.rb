class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "03ad1b8ca0eeebd212971db4bb5604e5271c032ad6e52fee2ddbe619f3ad06f9"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e2469a6c6cb96c52fbdd6a3fcd2ce2b0688953da12bcda10327e76c04d061d62"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5b0ec8bf1db044499ab6b43528fd79243eb6d38305ed30548b8ef6366461688a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
