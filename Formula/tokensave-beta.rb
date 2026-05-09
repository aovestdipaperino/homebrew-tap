class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v5.0.0-beta.1.tar.gz"
  sha256 "5bb6ac72a2885a742930ae9987c8a445ca72b34b6d99da6b026b70d90fee261e"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v5.0.0-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b3ffb38cff44a619c5112cd1b822e5245aaaf5ec40dbe39ca3d6d29997731a67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c255ca09b76e1951cc108dd7d92c4aa7268af12487279188398d48990dcb88f"
  end

  depends_on "rust" => :build

  conflicts_with "tokensave", because: "both install a  binary"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
