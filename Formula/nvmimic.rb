class Nvmimic < Formula
  desc "Drop-in replacement for nvm that makes new shells start fast"
  homepage "https://github.com/tsilenzio/nvmimic"
  url "https://github.com/tsilenzio/nvmimic/releases/download/v0.1.1/nvmimic-darwin-universal.tar.gz"
  sha256 "89a0743fd44fb637b9da88f7700d6ea74f7ec378e11a6e8b3c4ed463395121f4"
  license "MIT"

  depends_on :macos

  def install
    bin.install "nvmimic"
  end

  def caveats
    <<~EOS
      Run this once to set nvmimic up:
        nvmimic self install
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/nvmimic --version").strip
  end
end
