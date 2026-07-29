class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.5.tar.gz"
  sha256 "34ad2791c84370334b7de699b6334238869c59c8cb4214f0ccdaed63052e7e50"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2fce2d19e8d98737e73208d3b1649b77f5e2735bf6901cebe043abfd50ee1412"
    sha256 cellar: :any_skip_relocation, sequoia: "5bc8b84eb5545897d2b663830b5d2fcf446b9e12e0cf95aaa7773ec2075ef2ed"
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
