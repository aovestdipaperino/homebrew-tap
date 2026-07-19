class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "756b660c4817b2de7c7e814d8cc363cf71a1ae12a12f1fa175887e212b1aa036"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a727eae7be0675fb8823a11f317d3e52be7ff84d17d8b802f8eaff17dede07f3"
    sha256 cellar: :any_skip_relocation, sequoia: "46330f0cb06aa3bb8b224e3dd8dc6cf1f7b958c170812f3cefeb1c92e234b051"
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
