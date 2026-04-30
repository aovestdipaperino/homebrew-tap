class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.2.1.tar.gz"
  sha256 "f2391bed6c8844fde15d5a5ac5ec72da41fd3c19a0ce284b2792d621715cfcc2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dd91073671ef412b2c513e08a94f3a927c2386f9b2d4ee1d08a2fb6a4aa24f68"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5f835eb391a298f7be00c1c246ec5ae91f4dddd691ba5f0553ee0e3626c2cb9e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
