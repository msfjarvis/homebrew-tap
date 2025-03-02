class Adx < Formula
  desc "Poll Google's Maven repository to fetch the latest versions of AndroidX packages"
  homepage "https://github.com/msfjarvis/androidx-release-watcher"
  version "5.0.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.4/adx-aarch64-apple-darwin.tar.xz"
      sha256 "0a03ac33348af52752fd55f857deb86733ef8c87fbabb8cf35ab727387d7131b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.4/adx-x86_64-apple-darwin.tar.xz"
      sha256 "35103ff6a92ea6aa55687d241b970395cca519c431cf2fb90d691bcb3b9fe75a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.4/adx-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "060bd58516c59d87150bff99ccf1ac2ef32c727ff861c7949d878ce4fc72971c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.4/adx-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dce229116197d84fe769f48497000f32838c89ad79234e4be16a2b45a337a345"
    end
  end
  license "MIT/Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
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
    bin.install "adx" if OS.mac? && Hardware::CPU.arm?
    bin.install "adx" if OS.mac? && Hardware::CPU.intel?
    bin.install "adx" if OS.linux? && Hardware::CPU.arm?
    bin.install "adx" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
