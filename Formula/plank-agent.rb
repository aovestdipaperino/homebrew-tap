class PlankAgent < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.6.0.tar.gz"
  sha256 "818ebc820ff2229e586f53402e3b4aa79358a839d13f28f20841c812bd321bc2"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "71e695d4637bdd4a36e2d2bc827a2c147fb49df179514c5d23d33625ffd5441d"
    sha256 cellar: :any_skip_relocation, sequoia: "6706a4d8ab4f102b0a3ab9195e1ad4616f763f82681e6f9cc85929c20fab7feb"
  end

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
