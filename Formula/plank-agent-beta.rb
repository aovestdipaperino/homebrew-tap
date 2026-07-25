class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.5.tar.gz"
  sha256 "ff5388577a12638aaf3a8bcc3ed6556fe528695392065c630ac108500981240f"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "80d390121d64519576aa10c8a1bf93334dfa36679cdfd725112d06e91f8c906d"
    sha256 cellar: :any_skip_relocation, sequoia: "b3fdff020534d17aa3c4cea35be03f3dd84aee5f58178f386c8b3aed08f71f59"
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
