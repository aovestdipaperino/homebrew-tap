class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.3.tar.gz"
  sha256 "875dcfe055638da49792e8ef67da22cedc5798c8b1063cd35f884bb0ab16ca40"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "51991cfbbfb78ab910b2d16c238b2d5d89719a1e49194044344f8d036bdb1e61"
    sha256 cellar: :any_skip_relocation, sequoia: "5db48a9e672748b51caeece9a4d1176347cbdc547a2b209eef81b5fe585707d1"
  end
  conflicts_with "plank-agent", because: "both install a plank binary"
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
