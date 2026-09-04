class Kloudsec < Formula
  desc "Cloud security scanning and compliance from the command line"
  homepage "https://kloudsec.io"
  version "1.1.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.kloudsec.io/cli/latest/kloudsec-macos-arm64.tar.gz"
      sha256 "125bc7e3e602a42a0ac2349d5d02c77fed4f8c34fc923a06a3f9f6cc19e8f926"
    else
      url "https://downloads.kloudsec.io/cli/latest/kloudsec-macos-x86_64.tar.gz"
      sha256 "bbc4ff51d450127fe88a03f1afa98d4d3fd5ec8fe3811ffa5f9a89438bf0eed4"
    end
  end

  on_linux do
    url "https://downloads.kloudsec.io/cli/latest/kloudsec-linux-x86_64.tar.gz"
    sha256 "720b35049c9cc581f2f5b9e5e0f760aa30f31b1ec84cf129ea44b6c88014b73d"
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
