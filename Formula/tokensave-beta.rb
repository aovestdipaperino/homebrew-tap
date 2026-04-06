class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.0.2-beta.1.tar.gz"
  sha256 "ef5939247caabd0ce50abe72814836d27d55644d2a9530706b2d7bea5956745a"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.0.2-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "043f08a7811a98ceb979eb4c92c55a7e331a69e4786d171a0c2b7beaeb8d166d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aea4ccedd3be3f91028569f3c9bd291d3fcc34d31921a71e2fc06817c89d2454"
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
