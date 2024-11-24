class Gitice < Formula
  desc "Freeze your local git repositories for easy restoration"
  homepage "https://github.com/msfjarvis/gitice"
  version "2.0.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/gitice/releases/download/v2.0.7/gitice-aarch64-apple-darwin.tar.xz"
      sha256 "30c2c074dc7ba9d6d003afcc3c57ba39868312ccd51e01b79b0d080fc6023f76"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/gitice/releases/download/v2.0.7/gitice-x86_64-apple-darwin.tar.xz"
      sha256 "54d58551f6683209b8f8bc6c6fee46d70beb6db2e07c8489f5f052d6dbfa7c74"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/gitice/releases/download/v2.0.7/gitice-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3519fb77000fe73faaf06346cdf72c6e5660d005d47c24b909b1916bb631752c"
    end
  end
  license "MIT/Apache-2.0"

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}, "x86_64-unknown-linux-musl-dynamic": {}, "x86_64-unknown-linux-musl-static": {}}

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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "gitice"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gitice"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "gitice"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
