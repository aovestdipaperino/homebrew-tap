class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.1.0.tar.gz"
  sha256 "7acda14b2db7e4fca0a992f9a0848466f769c82d83055053cabb173ea6dca516"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "69ac45b42ea5881c5499fad3472544d3108a2359438d88c114a116315aad5bad"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "10a092efb88ca3d3a93549ef9f858b900ae15037e48f937963d27978069d7114"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
