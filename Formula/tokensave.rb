class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "0c1e54fffd8b992c945d95fca258638f08865c839365a8a7e679bb65a453c695"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "90f17e957ab70366ff90a7cd4c43ca2f645f847e5dbaba230c29c19bc70760f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6fb1bb87a76b9a95d6a220cdd71a656517e7d4aef456829d6b2ecdbb537bddc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
