class Plank < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "a82c3c2e7cef19b5659d4612d27287f757b0e2fd2a0f302925ec93441d1184f5"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7755e219fabeed5f50851851b4f1456a0d50abf7f1dbf0f0613ace6dc31ea77c"
    sha256 cellar: :any_skip_relocation, sequoia: "ac7e9be7c0cb3a8286443a8cc7a378f74cadf8eca95f463ac1a5a39951a05258"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
