class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from Rust, Go, and Java codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f6b829318cdb5df8c096926a6fed77b771ec8e2fb4846a7ec56a621050becafe"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "83d51efe698574d7953986ceb93c32d6836ee8cf83136bcd33b4a83b814fb45b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "69c780b0f79e43323d8d6fc5aeecd4cfcaad3a105d62a3649c3ff44b39b97661"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
