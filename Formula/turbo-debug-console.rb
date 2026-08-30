class TurboDebugConsole < Formula
  desc "Turbo Vision debug console for live token streams"
  homepage "https://github.com/aovestdipaperino/turbo-debug-console"
  url "https://github.com/aovestdipaperino/turbo-debug-console/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "82242da339c443a91bff76d8d23e46240e427a0d83240bd00af0763bd6b3dfd9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "turbo-debug-console #{version}", shell_output("#{bin}/turbo-debug-console --version")
    # The help text is where the fixed control port is documented, and it is
    # answered before the terminal enters raw mode -- so it is the one thing
    # that can be exercised here without a TTY.
    assert_match "7878", shell_output("#{bin}/turbo-debug-console --help")
  end
end
