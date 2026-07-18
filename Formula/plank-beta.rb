class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "66aa7c0be0c8aff1d0daab3667a473d507982accf65c6d30f108c895d14948b0"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ddeefe16415fa8c88880448389ed291f166d82830872cfc237487719fd1c7c66"
    sha256 cellar: :any_skip_relocation, sequoia: "8b4b5388cac4bb955a69c431b82041a49252c6ab6104f783ac6346143ed00dbe"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
