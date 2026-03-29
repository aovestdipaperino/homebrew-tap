class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v3.0.0-beta.tar.gz"
  sha256 "961bc846deb2db66205485b588c4ed64fb7dad95ea0d6efa27aea360842584d5"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v3.0.0-beta"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8b737887e86c2cdf34c4b4fcebbd74b082929847cb47d882ce1319707ea4ad23"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "55bb0fa4cde01ae4214fa28f3a705f7fe18284666b1563b565a2e4e4f4faa3a4"
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
