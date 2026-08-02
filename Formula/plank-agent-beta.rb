class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.8.tar.gz"
  sha256 "0e533a28f34576af512f1f488b35d5aba7711f0e78ce5ba77ddc78548b576425"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f98dbef96488c9fa66b436f81015f21bde40fe876ac87aa92159c357a89bc591"
    sha256 cellar: :any_skip_relocation, sequoia: "83b9cafe98f324abc00a3d3a72b2240e53485bab05e0026d3f92a5328fb958c0"
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
