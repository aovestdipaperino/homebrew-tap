class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.4.2.tar.gz"
  sha256 "aed0f2b3cbaa8fd999252da3ac1ad04439df27d04d1d14710a6f189bc874a8bd"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2318a13e6431e136035099bc1d9a3a10101b05055e389d1e0067603b24e99039"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c50558ae9ba5efc1da0fa7105433583cd2b0fb190bf06013383b9145d672caec"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
