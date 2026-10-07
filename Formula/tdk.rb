class Tdk < Formula
  desc "Turbo Vision debug console for live token streams"
  homepage "https://github.com/aovestdipaperino/tdk"
  url "https://github.com/aovestdipaperino/tdk/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "8e72d18767aad1e9882894e413736aea9273a1654b1e15414bf7e4d41ced822d"
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
