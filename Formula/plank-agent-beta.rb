class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.6.3.tar.gz"
  sha256 "a7e868237bcedbcf516001ccf50b4d2d91416dff9828b3d24fc880c02397d402"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.6.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "24273c61b3b965a571d77e5b9d595ab32ea0082b2a13f2b27db2bcf287f10b14"
    sha256 cellar: :any_skip_relocation, sequoia: "ba87a7411b237666d6cfdc1638f918173f18cb1ed7decfa722d6b0e0ab684315"
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
