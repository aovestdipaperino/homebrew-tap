class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "ff397673b8f7a8cbc4a63d43bc1e10c18297400c6ca39bcf3125fd076595f0dd"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7603d41b1e773c6245595fa6b67ac3ee7f3b94baabfb1fd5b1b83e87248a5427"
    sha256 cellar: :any_skip_relocation, sequoia: "4f4744dc6a2a013817d69d83ad64d67922fa03ac528b4ce9b91dc4d1449d4194"
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
