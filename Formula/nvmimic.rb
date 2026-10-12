class Nvmimic < Formula
  desc "Drop-in replacement for nvm that makes new shells start fast"
  homepage "https://github.com/tsilenzio/nvmimic"
  url "https://github.com/tsilenzio/nvmimic/releases/download/v0.1.0/nvmimic-darwin-universal.tar.gz"
  sha256 "ecf3c017344176f86ac78f3400d9332388bebd50a9563f18fe3f5ae367b7b564"
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
