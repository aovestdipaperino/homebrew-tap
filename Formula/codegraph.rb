class Codegraph < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from codebases"
  homepage "https://github.com/aovestdipaperino/codegraph-rs"
  url "https://github.com/aovestdipaperino/codegraph-rs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d58a7d33a75d78bbc5a31ab51488d93693310f6ed4a9c692e78f57fa9e5cdced"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/codegraph-rs/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6110c2ce7abc1ff348b490153706b0dac435f4c3e9185ecb9e73508a788c4d1a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "da9ed11c0d374dbab14b6ab362a7617e818c10fa981508eb7bd99844a0910a8f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/codegraph", "--help"
  end
end
