class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.4.1.tar.gz"
  sha256 "8e30c345beb6efda16e8f64d57240b5ec00778f21600ca0cddb740f9eb322e7f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b569aa1f17c78ab08cc2ceda60b6f4775a0447b06088814774bebdbcd308d4b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4a8b3123e96d0867017ce262c711f56e1549fa1cb0b6a0604daa6b5b4df7d25"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
