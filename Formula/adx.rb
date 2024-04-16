class Adx < Formula
  desc "Poll Google's Maven repository to fetch the latest versions of AndroidX packages"
  homepage "https://github.com/msfjarvis/androidx-release-watcher"
  version "4.5.4"
  on_macos do
    on_arm do
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v4.5.4/adx-aarch64-apple-darwin.tar.xz"
      sha256 "ff8744b2eee3f8e7f377590e0556378e51737554b11ed4d16e090a9094e79903"
    end
    on_intel do
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v4.5.4/adx-x86_64-apple-darwin.tar.xz"
      sha256 "87159f8141786c9d9b6641a77c83113da3b8a1737544b66dd6b5fcdcbb7fbb7e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/msfjarvis/androidx-release-watcher/releases/download/v4.5.4/adx-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f83a76eb01150913fc65d247d1a3ad8a2fff58ba99e24a357233eaf0683dbc9"
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
