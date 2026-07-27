class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.1.tar.gz"
  sha256 "3909026359fdf72267272899d915ad3ae6222142a426aaab300a578bae635b5b"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0eb9bfb2dab99678fcdd04d222c4400472ce5e46a5b8bbe5d66038b216067851"
    sha256 cellar: :any_skip_relocation, sequoia: "fe22e9d4c3210f2f87125da5559c523e9dcffbba7000e3d9c7b0f36ec2a13419"
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
