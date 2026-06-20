class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v6.4.4.tar.gz"
  sha256 "d76588e5e33b6d638856d89ceadc7757fbf56df17c9cdedf4b6a2d1bd6332263"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v6.4.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b912bbea95e21c72e541b243071d329f75b876209b80363cb886152b090a60ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1445c6da637e19b60b3c8aa6131ebae7c4a21a6e77df9037c2361ddf69b8b3f8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
