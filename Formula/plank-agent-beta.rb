class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.2.tar.gz"
  sha256 "8f8194de1f269cd1cb86221f2d938f07072687ba607784904570be8a8b6e4e39"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "03ae97fbeb3010653472abe5ae0a3ecf98d5e213f400c140e2e28e134671dd23"
    sha256 cellar: :any_skip_relocation, sequoia: "ce0e61ed764035d9d0364e911e088d4dd29f80462417b1a92d845234a5edf0dc"
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
