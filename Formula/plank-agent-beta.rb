class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.3.3.tar.gz"
  sha256 "52ae6561867cd2c50aff26071d92ef9ef7592557aa5fa49cc495043fadc87ad3"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "627901effe2189f92a9e5719cf052af1902c231c6ea631f159602919be1884be"
    sha256 cellar: :any_skip_relocation, sequoia: "6f2a4aa8e4f4c962ba2a656bc65c34d0f8f0d599e0cb862874826ea80cfa1c7b"
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
