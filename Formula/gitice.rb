class Gitice < Formula
  desc "Freeze your local git repositories for easy restoration"
  homepage "https://github.com/msfjarvis/gitice"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/gitice/releases/download/v2.0.3/gitice-aarch64-apple-darwin.tar.xz"
    sha256 "c07fce503731c126bc4fc729d3681ded47d64ca50037c3aa43a44fb80800e94e"
  else
    url "https://github.com/msfjarvis/gitice/releases/download/v2.0.3/gitice-x86_64-apple-darwin.tar.xz"
    sha256 "0983b0e59b3b3cb5aa405d5188e9ecc04f15200be72d7fb6a950919adc39d8b7"
  end
  version "2.0.3"
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
