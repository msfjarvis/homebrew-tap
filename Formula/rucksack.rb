class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.4/rucksack-aarch64-apple-darwin.tar.xz"
    sha256 "cb02ae2eb5ef6257f47206cc5cdec2381fe24a82161d5b7aeda6ed3b0d00a0b9"
  else
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.4/rucksack-x86_64-apple-darwin.tar.xz"
    sha256 "818c44ebdb69562ad66d99227635ec6924a7573de0119e3f657fd73f3677fb18"
  end
  version "1.0.4"
  license "MIT/Apache-2.0"

  def install
    bin.install "rucksack"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
