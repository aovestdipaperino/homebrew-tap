class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.16.0.tar.gz"
  sha256 "b810f93a5539453271106e8826d024e10b0f6e926942f8366f9bd9aacf425d6c"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.16.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c869127aafe054d143d47717378853ce5ee89d43cac3eeff6558b89ce53d95e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "862cdd80a8f9db27a6869a5b74a84c6dac058361d6424b6a3985f7d892094782"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
