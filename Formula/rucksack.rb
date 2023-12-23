class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.8/rucksack-aarch64-apple-darwin.tar.xz"
    sha256 "ac9156df84bbf7bbf764c097dd69f1dbe64fba54556c9a2082fee49ac77b932b"
  else
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.8/rucksack-x86_64-apple-darwin.tar.xz"
    sha256 "010f7bdb55d08a16fbf007b236629fd76536ddb829de2cc2c20569e7ef31f396"
  end
  version "1.0.8"
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
