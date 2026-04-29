class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.7.tar.gz"
  sha256 "1207785c362a92d92d2b545c271aefded25570b3ae988243338b22ba05ff5920"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "79292ff72f799c28e61af0124b292f19324a526db6d2600fb3b994e39870c1a5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bfbaf2dca1a06d3b365055ac54673ae1f4f7ad70246ffa76b9a1922afaa2ef71"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
