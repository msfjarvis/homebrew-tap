class Adnix < Formula
  desc "Rust binary to generate DNSMasq and Unbound configurations from UNIX host files"
  homepage "https://github.com/msfjarvis/adnix-rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.9/adnix-aarch64-apple-darwin.tar.xz"
    sha256 "7ded696f0319fe6fece2208bcd896815dc0e65b6866333dd090954b582a8efad"
  else
    url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.9/adnix-x86_64-apple-darwin.tar.xz"
    sha256 "7cae2dea297d72dae3f2bb5f4dbd3cb035046be6c0e1681ec949e7274e7f232c"
  end
  version "0.4.9"
  license "MIT/Apache-2.0"
  
  depends_on ""
  depends_on ""

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
