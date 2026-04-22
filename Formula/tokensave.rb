class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.1.tar.gz"
  sha256 "6e2bf90df74076c095fd1de623cba8f4378cf375efe5d0805617b39b6467f072"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ed5de5118521d61a36bd7f8ad87a0abdfa387a283557027927d3128d1e22f4d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cbebc4f425a7f5154a4323cd8924aac701cda222e3b27a95ece9c87dbec6e0c0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
