class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.7/rucksack-aarch64-apple-darwin.tar.xz"
    sha256 "a4c6557f0e16cbc749924a7835ee3c2c9e4d4c948e09077230548773be77e4d4"
  else
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.7/rucksack-x86_64-apple-darwin.tar.xz"
    sha256 "b9278d5c50578d1cf4a5147d771cd2928837bacbb3f768add009f7dedceca90e"
  end
  version "1.0.7"
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
