class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.5.3.tar.gz"
  sha256 "a13cecbc9799e93e2f585df9ee5a4baf766d841fa1a3bcbab8a2f3bc05eb187f"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.5.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e567214e99b97f0d81fbf9258a9de4d2bad648307d3e620dd6c374b9182fe8d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a085e84e95ca8ccb03e0810e5f264cfdd1113a926c83045c32c5670b7a1118e7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
