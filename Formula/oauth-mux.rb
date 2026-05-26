class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-aarch64-macos.tar.gz"
      sha256 "1676da055c888ba009275431ebb761c0f32330fdece9915463432d4764a7489d"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-x86_64-macos.tar.gz"
      sha256 "84175e2ef2e9c9a34253d2453492defb076067e18f3b244e0033a2aff6dc08b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-aarch64-linux.tar.gz"
      sha256 "40fb9ef4796f3de7b21cc765cea9c0cf67750452d29f2e89fe45f2abdbe7c349"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-x86_64-linux.tar.gz"
      sha256 "1048004487ebf2890703dcf2401f01738501701d4d5439094fda51609a451267"
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
