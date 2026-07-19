class PlankBeta < Formula
  desc "Interactive coding agent with a terminal REPL (beta channel)"
  homepage "https://github.com/aovestdipaperino/plank"
  url "https://github.com/aovestdipaperino/plank/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "0965c592a6a7aa5800bf60c1ac2a2e85c3b98dfa4cdd2ccf96de974801dc7ce7"
  license "MIT"

  depends_on :macos
  depends_on "rust" => :build

  bottle do
    root_url "https://github.com/aovestdipaperino/plank/releases/download/v0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b35106af7e266f40ce9d332307b1c2a4b6e365f87e8a6a46db460b38cec37d6a"
    sha256 cellar: :any_skip_relocation, sequoia: "bc3375c92d906b019fcfa4b81f651472a5531b2a36b8d82e6ca7557d86b3dbc1"
  end
  conflicts_with "plank", because: "both install a plank binary"
  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/plank", "--help"
  end
end
