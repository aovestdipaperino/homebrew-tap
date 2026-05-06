class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.7.tar.gz"
  sha256 "0c9aeb9d45aa16eca1af4a8476bcafe0123dc3fcf78a8a2999722bad13d89b6b"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5e570c9f5b95f84ad10541bf71262e3d7a243ce8d7ed2a19248535c6fe1e4ec6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee66c4cdacc54e25be44d7a2c2ae12581ecdc7e7044ca75e73a6247319bbfa42"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
