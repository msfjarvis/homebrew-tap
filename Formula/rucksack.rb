class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.2/rucksack-aarch64-apple-darwin.tar.xz"
    sha256 "d6483bcdecf3347cc7e65206d4ed2e26951d6c13829c4f165a90118bae917096"
  else
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.2/rucksack-x86_64-apple-darwin.tar.xz"
    sha256 "fa9c8afd5badf20a3a7c67a79f47cdce22522e01cbd54fb009f0d6a63bdbdffc"
  end
  version "1.0.2"
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
