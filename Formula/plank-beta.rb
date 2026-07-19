class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "d8ff2aaa39b6507cb2f025c0ce3111bae5deaff33a855a1b59e4376a3d733fbc"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ed5519a36ce904d6e415ec541e469bc8404c6c339303e682af4d093b8553378"
    sha256 cellar: :any_skip_relocation, sequoia: "b79158531c54d45bed34d2fa1d25432d6740c52b02f18aa20deaa346a9957268"
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
