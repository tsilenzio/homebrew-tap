class Diorama < Formula
  desc "Terminal color theme previewer with realistic TUI scenes"
  homepage "https://github.com/tsilenzio/diorama"
  url "https://github.com/tsilenzio/diorama/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eba4f214898504b4f9073f5d14c3e0f3c2a4ab1dac9b9f5a9692e638c4facfb1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Color Palette", shell_output("#{bin}/diorama --list")
  end
end
