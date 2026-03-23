class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "ecaede75c27701e7e521a4c39f19cc337157a95a943e8129f5eee8f690a34b7f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f0a8e2190fbbb06259d5271391d79e82a719a9fbdd2d3ff9b9bb4e87d919e448"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bd7bc3c6b4d62b9c1126269deaa9cc21e3a024649618cf96582298117ffcbb03"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
