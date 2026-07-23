class PlankAgent < Formula
  desc "Interactive coding agent with a terminal REPL (Rust port of ds4)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v2.3.3.tar.gz"
  sha256 "52ae6561867cd2c50aff26071d92ef9ef7592557aa5fa49cc495043fadc87ad3"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v2.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dfcd2c3af853eabd391357fb492718f3e8d432747218a95d52af77afb08d30f2"
    sha256 cellar: :any_skip_relocation, sequoia: "9222790db8e909a821f5c98ef5e093b7b009a062e7415e51a455bf3eb96b4675"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
