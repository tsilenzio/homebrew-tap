class Nvmimic < Formula
  desc "Drop-in replacement for nvm that makes new shells start fast"
  homepage "https://github.com/tsilenzio/nvmimic"
  url "https://github.com/tsilenzio/nvmimic/releases/download/v1.0.0/nvmimic-darwin-universal.tar.gz"
  sha256 "8a21881f2bed94b594cf74edb9ebec8f94f7635dee53d468876a920df6e8916b"
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
