class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.14/oauth-mux-aarch64-macos.tar.gz"
      sha256 "6e809ff478cfa842ee5949424861215237beb023ecd3d24a74592954b735a2da"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.14/oauth-mux-x86_64-macos.tar.gz"
      sha256 "c6da11fa2be141f5b01067a3cfc41eee114a64b5b32a637337add1d1a12fc1d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.14/oauth-mux-aarch64-linux.tar.gz"
      sha256 "da731cbfc1bef8838c901558af6b0bd75232727d51ea8438d174e1b452eef6c2"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.14/oauth-mux-x86_64-linux.tar.gz"
      sha256 "c9ecfeb314b2600021d541da0696d2cabe27d24ec50ebfbfb0e1b612c402a748"
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
