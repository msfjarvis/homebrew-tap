class Gitice < Formula
  desc "Freeze your local git repositories for easy restoration"
  homepage "https://github.com/msfjarvis/gitice"
  version "2.0.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/gitice/releases/download/v2.0.6/gitice-aarch64-apple-darwin.tar.xz"
      sha256 "2ce30cd3cb5ff84fcae4d6deed138d972efb4e8f565c2360c980be009c0b68dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/gitice/releases/download/v2.0.6/gitice-x86_64-apple-darwin.tar.xz"
      sha256 "8c3e094198aeb307d9a92db59d1e8be98a884cb444f27f0f89d6af8b381d2c15"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/gitice/releases/download/v2.0.6/gitice-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "72e0be28a01a08af10b365d68e0ca3c50d5a618bd046aef4b56943ec3cb4f685"
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
