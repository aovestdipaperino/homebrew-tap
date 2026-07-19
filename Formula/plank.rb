class Plank < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v0.9.10.tar.gz"
  sha256 "7ff11a38f6e4d602992d145d280c40bae8d86376d97632f489f8e1585a6fc7fa"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v0.9.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3276b3342436c754676000b37b2558e4c342e15f0ea49487f3e9a100f0f1d6b3"
    sha256 cellar: :any_skip_relocation, sequoia: "0c393ca98542bb3f00da35f614da4279c899418e25e450d24c7362834f19c70f"
  end

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
