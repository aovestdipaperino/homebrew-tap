class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "f5dea16375e0f64ffb5459c69dbcfbfd2e9bc0b07ac8d65864ec86f40a6a5fcd"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f10aa37db2f29ea88affc73189990b993865de6eb21d88320982d5f870e716d0"
    sha256 cellar: :any_skip_relocation, sequoia: "763f2c37fcf8826d1817ca4200c3d9c801eabbbb10457d8b2fe2b050827eec08"
  end
  conflicts_with "plank-agent", because: "both install a plank binary"
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
