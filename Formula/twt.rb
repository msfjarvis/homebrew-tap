class Twt < Formula
  desc "Tools for extracting metadata from tweets"
  homepage "https://github.com/msfjarvis/twt"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/twt/releases/download/v1.2.5/twt-aarch64-apple-darwin.tar.xz"
    sha256 "63e1ab19bbbeded9d4ac8af3ef4e6ea979a640599e4712e8990867b5c52bccd2"
  else
    url "https://github.com/msfjarvis/twt/releases/download/v1.2.5/twt-x86_64-apple-darwin.tar.xz"
    sha256 "59cfc46b905ca7bb3d65a650c9372c170b4226ccadc9ee9037ca9b1a0452871c"
  end
  version "1.2.5"
  license "MIT/Apache-2.0"

  def install
    bin.install "twt"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
