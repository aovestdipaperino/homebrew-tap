class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.4.3.tar.gz"
  sha256 "5d4478f75350abda8888d78cce4768039c3946745c752aa16894f4e8b1491e31"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.4.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ed11ede518f856ce62373e3830522ba94e155be22a9ba08011796f7bb13eda5c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e049d14b186e52b9d937c82752688bdcc24cbed5c216e9efd11f11732a07269f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
