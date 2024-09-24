class Adbear < Formula
  desc "CLI to enable ADB pairing over WiFi"
  homepage "https://msfjarvis.github.io/adbear"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/adbear/releases/download/v0.1.1/adbear-aarch64-apple-darwin.tar.xz"
      sha256 "c5b82bffeaaf81b1f0c451bd85721246c646012f48317f2ce3fda3c6ed09a645"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/adbear/releases/download/v0.1.1/adbear-x86_64-apple-darwin.tar.xz"
      sha256 "99bfd339bed91b43a1a091db620f87ff9539736d2c5bfa8ab5e608736e396548"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/msfjarvis/adbear/releases/download/v0.1.1/adbear-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "8a3016986890f674deae14dec9f4dcc8f707531d68834d74d796fc117c04c61f"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
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
    bin.install "adbear" if OS.mac? && Hardware::CPU.arm?
    bin.install "adbear" if OS.mac? && Hardware::CPU.intel?
    bin.install "adbear" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
