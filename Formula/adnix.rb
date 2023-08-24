class Adnix < Formula
  desc "Rust binary to generate DNSMasq and Unbound configurations from UNIX host files"
  homepage "https://github.com/msfjarvis/adnix-rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.7/adnix-aarch64-apple-darwin.tar.xz"
    sha256 "d212c6b9f34fd2784f64ab5f914f397cc5d4efc46493348e2c4635c0658f2edd"
  else
    url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.7/adnix-x86_64-apple-darwin.tar.xz"
    sha256 "c7064e68142e8db983e6597f9f8056171c3add39312f77a7ff48984827979200"
  end
  version "0.4.7"
  license "MIT"

  def install
    bin.install "adnix"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
