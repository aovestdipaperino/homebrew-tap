class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.4.tar.gz"
  sha256 "e05d22cd5d9d81febedf847bb5d13ea8e1edd65ba14dd4f0264b12b1e01695a4"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0f5c188ff71eb8f1a242e818f589613325cd676d3ecf6e929251f6fb986c6d85"
    sha256 cellar: :any_skip_relocation, sequoia: "ce177a6717f5b89a40bcbb1d68f6b91532c57dac45a26bc2f2637e6ddf05f55b"
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
