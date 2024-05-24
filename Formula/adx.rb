class Adx < Formula
  desc "Poll Google's Maven repository to fetch the latest versions of AndroidX packages"
  homepage "https://github.com/msfjarvis/androidx-release-watcher"
  version "5.0.0"
  on_macos do
    on_arm do
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.0/adx-aarch64-apple-darwin.tar.xz"
      sha256 "b0bed190f17c4ca4c35db8fadcbb2b3856754b9585bbbfc93d0a37c87a2429df"
    end
    on_intel do
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.0/adx-x86_64-apple-darwin.tar.xz"
      sha256 "f871cf984c334f24c2839a822b94307b9d55eb948f5bd69fe0d03c6021da6c46"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v5.0.0/adx-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4c328fb396bf104f3c5c8e33e35e47cc6d12ef387a3e92f649b83e238052b9fd"
    end
  end
  license "MIT/Apache-2.0"

  def install
    on_macos do
      on_arm do
        bin.install "adx"
      end
    end
    on_macos do
      on_intel do
        bin.install "adx"
      end
    end
    on_linux do
      on_intel do
        bin.install "adx"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
