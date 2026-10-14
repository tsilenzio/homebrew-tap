class Nvmise < Formula
  desc "Stand-in for nvm that keeps Node versions in mise"
  homepage "https://github.com/tsilenzio/nvmise"
  url "https://github.com/tsilenzio/nvmise/releases/download/v1.0.0/nvmise-darwin-universal.tar.gz"
  sha256 "46a60cad869cea2b072bc7662864136ed901baf1951bebad9f1b09d0b81c2e56"
  license "MIT"

  depends_on :macos

  def install
    bin.install "nvmise"
  end

  def caveats
    <<~EOS
      nvmise needs mise (https://mise.jdx.dev) on your PATH.
      Run this once to set nvmise up:
        nvmise self install
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/nvmise --version").strip
  end
end
