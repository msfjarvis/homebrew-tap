class Rucksack < Formula
  desc "CLI tool to collect files from multiple directories into a single target"
  homepage "https://github.com/msfjarvis/rucksack"
  version "1.2.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/rucksack/releases/download/v1.2.2/rucksack-aarch64-apple-darwin.tar.xz"
      sha256 "1e8ff6257c769279d3fa26de8e721c74ee7c95b2377c498dc552a43d3bd622d5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/rucksack/releases/download/v1.2.2/rucksack-x86_64-apple-darwin.tar.xz"
      sha256 "6911fd745f59dc7e6d22dc52f835a4fb76c3a8c4c9e41e88249a44946e5460ca"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/msfjarvis/rucksack/releases/download/v1.2.2/rucksack-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "ff781b119b81c890bc7e513e65bcb4f9701dbd368fc6d1ba1b36fee3a4273c11"
  end
  license "MIT/Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "rucksack" if OS.mac? && Hardware::CPU.arm?
    bin.install "rucksack" if OS.mac? && Hardware::CPU.intel?
    bin.install "rucksack" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
