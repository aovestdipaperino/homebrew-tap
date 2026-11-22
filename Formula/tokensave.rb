class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v7.17.1.tar.gz"
  sha256 "48c0000cc4b7ef8bac199738afcc8a57ca5eb9c5a6cf0991ef90f82e054ce997"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v7.17.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2ffd6a64cd75ab3d8d567b4298dd58e70913c426bafe196dd2bfc2f89145a5d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b1793d8c07f74905cbf9cb4d2ae7ccc750d18f38085fbb27a3f74adb4f1a47ec"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
