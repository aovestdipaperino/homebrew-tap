class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.7.tar.gz"
  sha256 "e320666dee591d88bcf636f11f05066d81eded5c7f1f4f7dabd0d9f63616be92"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b61741da12f3ef3e4cef17d7b06982fccd6d4e0ac9c1c1fd82b152150193053"
    sha256 cellar: :any_skip_relocation, sequoia: "cfe529c781d55ac336fb7b0560a6939593627e28a97e211c9187682a80d9c748"
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
