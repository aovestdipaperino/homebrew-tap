class PlankAgent < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "d75261d8efb662cfe9b693132e45ba782e78c6335987e74b8bfacb188c5409bc"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "634b98f9ca1f0617ab383b8e7f6881b76b798d9d6375a5f36bcc7b2a8c98a0c8"
    sha256 cellar: :any_skip_relocation, sequoia: "9fdfe56722570a99f66123ac1d32a54fced8099a0e9cc0178de46dd5c82ad149"
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
