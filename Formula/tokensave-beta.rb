class TokensaveBeta < Formula
  desc "Code intelligence tool (beta channel)"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.1.1-beta.1.tar.gz"
  sha256 "f84d355d7f60d0ffba99c47a71ea45cbc5330db6efc2a9508969295bbd6c91f2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.1.1-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "79bd745ae258ca7f4008db82367d5fd71698a1665d2cb25af47ce0036bc41c35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1c0b9d7c16067a9f8a688dd50ba6324580049f990480be40a1e0d4d84a885fd8"
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
