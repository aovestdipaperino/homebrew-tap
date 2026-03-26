class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "76389e76c344f26b1260b55a68b0ab540f73fe5c7f984d7f0a5b76a9bbf2d931"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8cd6c7c41631a42e5559a7a35530b2962065c41e1e8d07ad5183207bac045069"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dda17f711dcf3508939fe449d5092caf69c7c8dbe9387285f5dca9e1b1fd8b17"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
