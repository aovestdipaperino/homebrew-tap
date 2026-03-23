class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "c4524d35c24525795ccf65a45c6898e57ec03f587d46a6906670c2f902221e4f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b630c96a361830c8ad38b426a0797f9a849aad85743b2f3d8a57aaaaf287341c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6ef0c638c8cd0480197d8d8686ad02be61d4ed2ed100cd3aef7d57c9052857f5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
