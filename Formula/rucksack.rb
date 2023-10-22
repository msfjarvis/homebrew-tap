class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.3/rucksack-aarch64-apple-darwin.tar.xz"
    sha256 "6ceeed8e532c556c9b21a61684d3fbfafae3a049cc3d1491c63ba340545b6d9f"
  else
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.3/rucksack-x86_64-apple-darwin.tar.xz"
    sha256 "00259c0292832d4c4e90ba2f05846c196b4060c6100d315da445ef5ff46535b2"
  end
  version "1.0.3"
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
