class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "23f18202be13fac16be959425c2afca4686ccb9510e1f12fbcd2d1c653ebe197"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "398b84065b384977d9dffea2e7809c6281af3d907ead41fd022b28e0a37751db"
    sha256 cellar: :any_skip_relocation, sequoia: "2bd2590ab1d5512a24ee8358f1b731876a6ee40e842d475a15bfdb724df7c6d7"
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
