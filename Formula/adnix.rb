class Adnix < Formula
  desc "Rust binary to generate DNSMasq and Unbound configurations from UNIX host files"
  homepage "https://github.com/msfjarvis/adnix-rs"
  version "0.4.10"
  on_macos do
    on_arm do
      url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.10/adnix-aarch64-apple-darwin.tar.xz"
      sha256 "00eed0760fe819d3f9dfb22654da34463a7dc120441865e797908d13ce25298b"
    end
    on_intel do
      url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.10/adnix-x86_64-apple-darwin.tar.xz"
      sha256 "f31a214859dee8f1be13e0df6c4829f466d1905579ccff08ffe8f5b1f9d89fd9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/msfjarvis/adnix-rs/releases/download/v0.4.10/adnix-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3826c9a59f701a87c0cd47d1fe298c1747aaefee05c1ac3c141b14dad3801fdb"
    end
  end
  license "MIT/Apache-2.0"

  def install
    on_macos do
      on_arm do
        bin.install "adnix"
      end
    end
    on_macos do
      on_intel do
        bin.install "adnix"
      end
    end
    on_linux do
      on_intel do
        bin.install "adnix"
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
