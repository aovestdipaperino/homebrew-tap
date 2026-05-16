class Tokensave < Formula
  desc "Code intelligence tool that builds semantic knowledge graphs from source code"
  homepage "https://github.com/aovestdipaperino/tokensave"
  url "https://github.com/aovestdipaperino/tokensave/archive/refs/tags/v5.1.1.tar.gz"
  sha256 "ab01f69eecb33cbb54c4dc11d2a191e0163915db16e97fa9ad7f4420340fa046"
  license "MIT"

  bottle do
    root_url "https://github.com/aovestdipaperino/tokensave/releases/download/v5.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bdb6f9555f10042bae90994abafdb8c99f1ccf3f76dfebbea291303e84d9ebfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "43dd848f3ce45d33482adb10a0da19029df7fee93159d610f9d54696616b8231"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tokensave", "--help"
  end
end
