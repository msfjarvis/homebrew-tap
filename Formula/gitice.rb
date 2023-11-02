class Gitice < Formula
  desc "Freeze your local git repositories for easy restoration"
  homepage "https://github.com/msfjarvis/gitice"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/gitice/releases/download/v2.0.4/gitice-aarch64-apple-darwin.tar.xz"
    sha256 "c53092439cbad8cf6a0f69262c42bc8262123e23f3f276bbe81b5f36fe376af3"
  else
    url "https://github.com/msfjarvis/gitice/releases/download/v2.0.4/gitice-x86_64-apple-darwin.tar.xz"
    sha256 "11f9cae87d01ee7d411153791e606f742f5b3e0ac8d37f062b78117620267faf"
  end
  version "2.0.4"
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
