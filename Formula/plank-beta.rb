class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "a82c3c2e7cef19b5659d4612d27287f757b0e2fd2a0f302925ec93441d1184f5"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42c531644a741124bc55ebba53ad8b1a28703d17e1a16b300b030458eaaea19d"
    sha256 cellar: :any_skip_relocation, sequoia: "fc386483ba0d251e8a210fc26e896f054334f2c36151cf55b654b839cd2c55d6"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
    # Metal kernel sources are only present when building from a
    # checkout with the ds4-ref submodule; the GitHub source tarball
    # lacks them (EchoEngine-only build).
    (pkgshare/"metal").install Dir["ds4-ref/metal/*.metal"] unless Dir["ds4-ref/metal/*.metal"].empty?
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
