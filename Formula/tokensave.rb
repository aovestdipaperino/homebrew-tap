class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "e1e56700c72ff11e2a21f1c71f5939d23edb9751941a3da1c22508eca893ba44"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.7.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c739e99b3d9b4fce5504df15dc924ea1b6fea5c27d83dfbf861048fb75c45ef6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d7412a8d7ea8e2cc0696866b3eb5401ff8ff983fcede380231bc223627dc30d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
