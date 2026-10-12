class Sidecarctl < Formula
  desc "Start and stop Sidecar sessions to an iPad from the command-line"
  homepage "https://github.com/tsilenzio/sidecarctl"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tsilenzio/sidecarctl/releases/download/v0.1.0/sidecarctl-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "85f2ba4610eaac32a5f490e425aabdf532be50a7f5bda841f609d1d8bebdc4fd"
    end
  end

  def install
    bin.install "sidecarctl"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/sidecarctl --version").strip
    assert_match "usage: sidecarctl <command>", shell_output("#{bin}/sidecarctl help")
  end
end
