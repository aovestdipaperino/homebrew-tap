class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "a2600d9400f52a24e4a3edeeda879be3ba1a435defac90963e3191cb1e31a767"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "33e233bb8b7d5f9401617f11df405379de3862752338fd78646dd9a4df3638b7"
    sha256 cellar: :any_skip_relocation, sequoia: "e3b9af7b075163743a3fb49b0ae8a359401f62af6987de3e45e300a09d016052"
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
