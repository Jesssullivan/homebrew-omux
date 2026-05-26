class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-aarch64-macos.tar.gz"
      sha256 "4324722b48735a29c1d877c866598dffd7ccade71ff4e084990fe2344112f3ff"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-x86_64-macos.tar.gz"
      sha256 "0da6bc5743cec74073d596f4a0fde4fd94e75b24bd89c8bac6acf579ce64747f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-aarch64-linux.tar.gz"
      sha256 "5a17595fd89def2bd265daa39c19917870013065c6f031f3fd1650c4bbc80b29"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.12/oauth-mux-x86_64-linux.tar.gz"
      sha256 "84cc2d21da1f5d55addc0a9368f7a444b3444e0f807893f4fafc60fd4e09518f"
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
