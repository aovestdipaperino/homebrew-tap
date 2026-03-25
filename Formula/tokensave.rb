class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "b825bde1d3f97a53f367761bb55558cc617c3775875c421c8c8edcf9f38d9e57"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v1.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "42f3917f137d1af13a28a3748287f6dd7ee650331b0455c82ad3d78bbd365a70"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a4345bbb08cb75338818fc633b581ef69e0fa0c65f19fc945cc8df8b88011525"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
