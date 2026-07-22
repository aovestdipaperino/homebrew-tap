class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "3eb2deb5a82453df6776b4ee57f13e6cf9722c8cabd3c1995ded323c7ff930b9"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6550fced0f75068fe151e9d3b3f9453d4a6050c870cfc05411a582b4cb33a8ba"
    sha256 cellar: :any_skip_relocation, sequoia: "fcaffc4e431e8e78fe601ed89aab561b05e9ea83b983d42a5899282cbe059120"
  end
  conflicts_with "plank", because: "both install a plank binary"
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
