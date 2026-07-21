class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "b1bd0a2f497d99624d5733657436108938ed0b1f32871aa8f050dc34e441c07b"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3a4fc71b6f6ed43706f5f377009735dd9022d6922e683ac42c981c2289f176a"
    sha256 cellar: :any_skip_relocation, sequoia: "d94fa5b528743dc9d901425a87dc1aa0986c636fe1e280d1a6e583fa86d355c4"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
    # Metal kernel sources are only present when building from a
    # checkout with the refs/ds4 submodule; the GitHub source tarball
    # lacks them (EchoEngine-only build).
    (pkgshare/"metal").install Dir["refs/ds4/metal/*.metal"] unless Dir["refs/ds4/metal/*.metal"].empty?
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
