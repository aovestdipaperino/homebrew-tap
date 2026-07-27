class PlankAgentBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.6.2.tar.gz"
  sha256 "2b664d0509868fc8bc850037c3e11e1b3ef259ec35d32534952aa593c0a351bd"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.6.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0b49bc419e2004937663065679c86bb6734b5e45af50b38e9ed94463f53436b2"
    sha256 cellar: :any_skip_relocation, sequoia: "db089ae09f15094aed225a3da2b876227bd468858a2074885b0a26cd55138c65"
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
