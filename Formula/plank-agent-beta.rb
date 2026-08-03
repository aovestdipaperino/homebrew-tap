class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.9.tar.gz"
  sha256 "ca93d127e1db9347ccc252d361ecfe2b618f797a8292f5c02684be5ce575bc0e"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7f428d4ab43d6ad01460e6716124be4766ef49008d39be5f6a532c088261d30e"
    sha256 cellar: :any_skip_relocation, sequoia: "3149d6e4c01f31b83d7aeb7731072affe9b4b458cc51cf0a5a5ab094546b1881"
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
