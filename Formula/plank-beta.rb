class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2f54cf6632287f6c2c75f042bbdd4e7fda743cb1e89d2efc0e59189482fa0723"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ac7afeb30518549140afb132d279dde6b0914be29b9bf61df88ca434b9fa0f22"
    sha256 cellar: :any_skip_relocation, sequoia: "3f2bd41a18482fae5f337051079e1323c8e716860380f392593e45014fef6fe0"
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
