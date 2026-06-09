class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.2.0.tar.gz"
  sha256 "2b4b90be8b5a589bc579628a6b0e11d2b2484239056f75bc6c351713562b99f4"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d50015e9298a2b3fc8e17f93a30a1cfc70b723fcd648e8841b64876245abf217"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "efff1b1f3cd4e283281e227d442608dea7f009c783b03f410dd11350c4201cf6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
