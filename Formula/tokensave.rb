class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.4.2.tar.gz"
  sha256 "eeac4559434eb1bb9fd370887e654fb56482fad0a5a505022771d38183c5578e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7c8de668cecfd00b41c95ba8c2e3b4d9e4fcbd2467c7f88c79ae91b5d9678251"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b346a9064cabe3d4beec2afaa53dcebc2122746109c2dece552984930d37a1de"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
