class Nvmimic < Formula
  desc "Drop-in replacement for nvm that makes new shells start fast"
  homepage "https://github.com/tsilenzio/nvmimic"
  url "https://github.com/tsilenzio/nvmimic/releases/download/v1.0.1/nvmimic-darwin-universal.tar.gz"
  sha256 "6a1326b0f279fb378d3640e221def270d69ac1a3bf583dde91156c526c76ef8e"
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
