class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.5/rucksack-aarch64-apple-darwin.tar.xz"
    sha256 "916ffb86a4778ea689373741ca55e2d72a08510f91b4cd48d6ffa456b484537c"
  else
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.0.5/rucksack-x86_64-apple-darwin.tar.xz"
    sha256 "e3e3635742e5b9f764288c2171e5bb955919c7cee1cd08191ca152afc882f328"
  end
  version "1.0.5"
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
