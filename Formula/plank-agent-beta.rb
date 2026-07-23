class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "8ff5a20704631c15159b869a8dda3d6c210a43e190e28b8cfd2d1ac9abf225de"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ffe38e9a877e8399e2a89be59861dba94767b22ef5f87ea8ae3fc2d9e2a45106"
    sha256 cellar: :any_skip_relocation, sequoia: "dc1bde6a269cd74552c7ed594f4395b26f9ec080ae90e767b4faadb26855181a"
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
