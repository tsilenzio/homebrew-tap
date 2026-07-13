class Diorama < Formula
  desc "Terminal color theme previewer with realistic TUI scenes"
  homepage "https://github.com/tsilenzio/diorama"
  url "https://github.com/tsilenzio/diorama/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Color Palette", shell_output("#{bin}/diorama --list")
  end
end
