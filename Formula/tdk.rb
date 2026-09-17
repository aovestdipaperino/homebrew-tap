class Tdk < Formula
  desc "Turbo Vision debug console for live token streams"
  homepage "https://github.com/aovestdipaperino/tdk"
  url "https://github.com/aovestdipaperino/tdk/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "76da1888741ea5744566a4a9bdcb3691b69c460ed14c45d657c42d6196f4b6e5"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tdk #{version}", shell_output("#{bin}/tdk --version")
    # The help text is where the fixed control port is documented, and it is
    # answered before the terminal enters raw mode -- so it is the one thing
    # that can be exercised here without a TTY.
    assert_match "7878", shell_output("#{bin}/tdk --help")
  end
end
