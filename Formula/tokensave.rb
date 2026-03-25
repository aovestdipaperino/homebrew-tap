class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "bb984165121bf41173d78f0305214e2df68229e56c5b2323d931b0b4bcc5f351"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1d2b530f75ffb971aa39b0b7ea63be763e8f1f0c548d7b4e1cf96b1a57dbc12f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9bfba4e3d0fce668f0c80159b528d1c8367619e11b887dce385695140e5c3c29"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
