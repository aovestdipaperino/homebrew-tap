class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.3.tar.gz"
  sha256 "e4f2cc02d996211e17b64ff887ca35caf8e9886b32da608d4adc1d089f15d640"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "954829e76e65a018953d6dbcf33d7df7772d3ea5355a7cf47dcb67135d128398"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52fa816ea369d4171cd017aacc7cebbb30fb5df486327f58073d237784219099"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
