class Diorama < Formula
  desc "Terminal color theme previewer with realistic TUI scenes"
  homepage "https://github.com/tsilenzio/diorama"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tsilenzio/diorama/releases/download/v#{version}/diorama-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f79f575f23d20a255573ecc7731eaa82d31935de1ddaecbfc213bb2651b6eab3"
    end
    on_intel do
      url "https://github.com/tsilenzio/diorama/releases/download/v#{version}/diorama-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "786bc52c06c111d0382f2594be7481dba8581211e8f3c7d85b0d88287aec49b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tsilenzio/diorama/releases/download/v#{version}/diorama-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9e5b9f582a892fd103d5a9d615c9becfbd29b06ee9e77da73861315dce06021"
    end
    on_intel do
      url "https://github.com/tsilenzio/diorama/releases/download/v#{version}/diorama-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e83337b0ec3faa92207954bc6174a430b349e30338c017cee9f546adef7eced1"
    end
  end

  def install
    bin.install "diorama"
  end

  test do
    assert_match "Color Palette", shell_output("#{bin}/diorama --list")
  end
end
