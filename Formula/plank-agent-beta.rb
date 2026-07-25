class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.3.tar.gz"
  sha256 "e3768bb966016a6018c418693155dba25f0288c0700e7f2bf1b98894753136d0"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a847e27b7bd21a14c3537b06ea36418786e7b540070de2a1286da5bc6e8aafdc"
    sha256 cellar: :any_skip_relocation, sequoia: "4afbc8e4b0f8ac6539d18bddd427e409c3cce2e9cda955b6163de137007fb7ff"
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
