class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.10/oauth-mux-aarch64-macos.tar.gz"
      sha256 "8a1e3516fabaec9a3b518f38db77ad4240c30f7809ca98ed1052e0e8824fdc7d"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.10/oauth-mux-x86_64-macos.tar.gz"
      sha256 "465a285434b2429fcc57d627522b13e6d1c425b1869f87c4c999739f3e346bbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.10/oauth-mux-aarch64-linux.tar.gz"
      sha256 "ab29c88c61e3e2da1eb4624d0403facab6a311104326b79d17f4053af8cb3e6e"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.10/oauth-mux-x86_64-linux.tar.gz"
      sha256 "b55635c10a034be307295b2b2f7d43501437efb0975662613866a61ccf54c800"
    end
  end

  def install
    bin.install "oauth-mux"
  end

  test do
    assert_match "oauth-mux", shell_output("#{bin}/oauth-mux version")
    system "test", "!", "-e", "#{bin}/codex"
  end
end
