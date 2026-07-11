class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.15/oauth-mux-aarch64-macos.tar.gz"
      sha256 "c4803a23035da38a1c177da431f91ae390c3659848f4112a18464aae688e2574"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.15/oauth-mux-x86_64-macos.tar.gz"
      sha256 "a65947e2ec892cb8a005122b9d48b75a0bdf54b260f0ecd949814922b6d243f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.15/oauth-mux-aarch64-linux.tar.gz"
      sha256 "2693ae633c17cf8e12c743a1266e0a48d53573f40cf89c58a1a28e2284cd248e"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.15/oauth-mux-x86_64-linux.tar.gz"
      sha256 "f44ed42a3d067648bc8481393ce8348c797faffce45c1ccacde623bc8ee09331"
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
