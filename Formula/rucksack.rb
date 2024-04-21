class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  version "1.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/rucksack/releases/download/v1.1.1/rucksack-aarch64-apple-darwin.tar.xz"
      sha256 "22f2e0ee0437ca496e8adac022b47340c66c6a000703227227d23b0c5db8aced"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/rucksack/releases/download/v1.1.1/rucksack-x86_64-apple-darwin.tar.xz"
      sha256 "e1ac9b4f317da35d6b9e4094b2facfdbd8f77baa4f6f740758d96ada017d46fc"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/rucksack/releases/download/v1.1.1/rucksack-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e4b3471b5806a691f5d8f4752ebe88355c9a31835e36233af33ddd6f0c65c008"
    end
  end
  license "MIT/Apache-2.0"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "rucksack"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "rucksack"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "rucksack"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
