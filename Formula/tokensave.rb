class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "399e2502c3c921042e1f6a081de43d3f6542378548e03f64884c09fa56ce51a3"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7e1c6297df4b0da0b7a9a4cb14dd2c24dfffd1ffef046a631c0b58e7a1cf3328"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "86f8fb61da7aef8c65aeb0801fd03dba3e00f82503d037a57e44e236282681de"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
