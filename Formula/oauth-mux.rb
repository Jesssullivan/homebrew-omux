class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.13/oauth-mux-aarch64-macos.tar.gz"
      sha256 "acdf8f2c0cee87aef7f2827c98b67eb7b187bd92cb3d40e4e67c35ed1ea689e6"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.13/oauth-mux-x86_64-macos.tar.gz"
      sha256 "08f8c60857569f6252cfda225190b2d606246dc359b08a34cb092014ec996ab0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.13/oauth-mux-aarch64-linux.tar.gz"
      sha256 "8096a60a432826b2d7c62edba2b166c09dc1fcf2749bcd86bc11b7a7476ad646"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.13/oauth-mux-x86_64-linux.tar.gz"
      sha256 "e990463b0ded8f8d344dd6ad0bc7596b6e0f1d8eeacc5d76d81e24184eced714"
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
