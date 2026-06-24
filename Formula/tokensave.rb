class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.0.1.tar.gz"
  sha256 "3cf6bbbf594a4678fb81033e493345e10498b41b7cba3c856b6be899b8f3df91"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e46ee62c3ac306abeaf67acdd0b3d9eaec378ddcedeffed3331282c780125392"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dd4bbdb0eb0f1c0c9674b25e28f4e421d30b3e00fc2350a7c0b36a67dd07aa72"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
