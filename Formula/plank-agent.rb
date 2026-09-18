class PlankAgent < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v5.2.0.tar.gz"
  sha256 "e5f4397fc8b1f4787222dbf45c8ed4e3df82cecb2c251faabf4dcc1578697006"
  license "MIT"

  depends_on :macos
  # arm64 only: the ds4 Metal backend cannot run on Intel, so a source
  # build there would spend twenty minutes producing a binary with no
  # inference engine. Refuse up front instead of shipping that.
  depends_on arch: :arm64
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v5.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8343bae49ad1de9e9ae48c816df8a94b6d622556e2478de46953727b688c7d2d"
  end

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
