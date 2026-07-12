class Seb < Formula
  desc "Render mermaid diagrams to SVG — byte-identical to mermaid-cli, no browser"
  homepage "https://github.com/aovestdipaperino/sebastian"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aovestdipaperino/sebastian/releases/download/v0.3.0/seb-aarch64-apple-darwin.tar.gz"
      sha256 "0cdbe2abeb3509b170f3cb90a72beb69dcd69588d85b43b47b67c7cff1729f3a"
    else
      url "https://github.com/aovestdipaperino/sebastian/releases/download/v0.3.0/seb-x86_64-apple-darwin.tar.gz"
      sha256 "a49cf99dfce41393075805c7399f0726937a679be56bf9b6fbc4779b8b043bb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aovestdipaperino/sebastian/releases/download/v0.3.0/seb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67aee51fe1329deddd2ae5cf1ee3dc8debe06bf7fab5502aa084a6f7261fceec"
    else
      url "https://github.com/aovestdipaperino/sebastian/releases/download/v0.3.0/seb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "686c0ffdf8b019154c550126222f145def010c5d4b6b90d97378ac0cce3336f4"
    end
  end

  def install
    bin.install "seb"
  end

  test do
    (testpath/"t.mmd").write("flowchart TD\n    A --> B\n")
    system bin/"seb", "-i", testpath/"t.mmd", "-o", testpath/"t.svg"
    assert_match "<svg", (testpath/"t.svg").read
  end
end
