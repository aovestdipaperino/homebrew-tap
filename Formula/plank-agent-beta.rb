class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.2.tar.gz"
  sha256 "126125dfaf45f7cce7a8902f5919b86801f0738708cedeb37d47bd576917b11b"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1cdb9375d0ee1c6f5e689271fdefbb22ddd69ca0446bd5401b4b069715de4981"
    sha256 cellar: :any_skip_relocation, sequoia: "faebf9f4b1846014088bfafb88fdbdfa9b517cbb703f0e997979eebad023038d"
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
