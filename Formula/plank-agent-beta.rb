class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "38f75fd7511a67b94afb6aec61c8f46e70bb5a7087ee3fb524e8df8e7713d486"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a0d667e7e2a4ed5b3fb42799008eb79d766c602cafb0523a6066c01cdccd8b56"
    sha256 cellar: :any_skip_relocation, sequoia: "109bad3636b88f52bb3bf79e4db7afc3c877858339f49bbf7bdd9d718c6f0cda"
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
