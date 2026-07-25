class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.5.4.tar.gz"
  sha256 "04a93708283a228eee4d4e34ee5794f85b74b9f3dd355ee76b7ed3d11f348fde"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.5.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a71ab9659ceb2d1f76ab55cffadf1e1258677c38958070c70572055a8c3e46ef"
    sha256 cellar: :any_skip_relocation, sequoia: "6822a4a9e1a57544affe9e78dd541422f9da1c31531e0e95d5b3775ec1ef6791"
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
