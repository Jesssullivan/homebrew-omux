class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-aarch64-macos.tar.gz"
      sha256 "62da7b5f3b12d1e617158f690ba4534555b9f145fabd89475816d3191f0215ae"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-x86_64-macos.tar.gz"
      sha256 "82f3cf433171a1a499f34fa1c89f9bcafbaa1cc0ab40a253cab9e7a18e325bdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-aarch64-linux.tar.gz"
      sha256 "0294f78cab353387f3b4b9b359fd6f2a2f08333588f2bb013ce300dcd14d6175"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.11/oauth-mux-x86_64-linux.tar.gz"
      sha256 "6555dc79a986fdea2219538c02e593b2292dc0761f1652ace24e7d2a58dc3f60"
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
