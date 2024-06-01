class Gitice < Formula
  desc "Freeze your local git repositories for easy restoration"
  homepage "https://github.com/msfjarvis/gitice"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/gitice/releases/download/v2.0.5/gitice-aarch64-apple-darwin.tar.xz"
    sha256 "7ccb8f7f27be2ff3453393d7e91015cde835ffc69460d29138be07c229c62931"
  else
    url "https://github.com/msfjarvis/gitice/releases/download/v2.0.5/gitice-x86_64-apple-darwin.tar.xz"
    sha256 "c4039099e2ef6f34943f101973891042121de2c19c117a09a2f84d67813ffe91"
  end
  version "2.0.5"
  license "MIT/Apache-2.0"

  def install
    bin.install "gitice"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
