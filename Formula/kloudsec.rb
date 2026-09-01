class Kloudsec < Formula
  desc "Cloud security scanning and compliance from the command line"
  homepage "https://kloudsec.io"
  version "1.0.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.kloudsec.io/cli/latest/kloudsec-macos-arm64.tar.gz"
      sha256 "5d057777458e16d841a8d84ee3733e225af9ed836d8f0b2bbda8cce42e8c839c"
    else
      url "https://downloads.kloudsec.io/cli/latest/kloudsec-macos-x86_64.tar.gz"
      sha256 "4063d903f75361e83122821b5a98c39da9783e2ca9d73f47ce26023abfb7fa53"
    end
  end

  on_linux do
    url "https://downloads.kloudsec.io/cli/latest/kloudsec-linux-x86_64.tar.gz"
    sha256 "dbe558ad3e7a43c3ae29eabccea8a4ae3aa10c3f4b27beb651c3fe22952f42f4"
  end

  def install
    # The release archive is a Nuitka standalone build: the "kloudsec"
    # executable ships alongside its own Python runtime and shared
    # libraries, and resolves them relative to its own path. Installing
    # only the binary would leave those dependencies behind.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"kloudsec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kloudsec --version")
  end
end
