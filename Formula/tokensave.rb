class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v4.3.6.tar.gz"
  sha256 "1792d9c146ce85fc62383205745ec8cca8e1a4c6ba8040dbcdcfbc4c26c3b2e2"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v4.3.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9961cd16fe34599fe1c29a90000f0255811e0a16fde8066086b0ec88beeda0d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "91a3a3672863443884b71fe70bb03735af0acf42c7a674cc4a4d907fc0a2b2e7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
