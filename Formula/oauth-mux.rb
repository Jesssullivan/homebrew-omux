class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-aarch64-macos.tar.gz"
      sha256 "c3e4eccf1e3a65c1e637245480a1f6884998a0aed2de6f26472eabe9a2b09c53"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-x86_64-macos.tar.gz"
      sha256 "8c31a41eb3485cc3be6593c52204db496ab79cea4aebb7241a180855c4982223"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-aarch64-linux.tar.gz"
      sha256 "8b0b8ee4f2455447aef9b0c1fa9a30621eb87f23e5f2920dac752da034a5f19c"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-x86_64-linux.tar.gz"
      sha256 "185143937f94e97ff89e07f6b51ec84753fee5c659f9f45cde54003d03d7a96f"
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
