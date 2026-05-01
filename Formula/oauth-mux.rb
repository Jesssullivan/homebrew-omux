class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.6/oauth-mux-aarch64-macos.tar.gz"
      sha256 "fad35fc566fc53c98d9b6ad47db1987d5143a812efd7630eead7b435a665ba8b"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.6/oauth-mux-x86_64-macos.tar.gz"
      sha256 "1d1df4c7014a80f180741e6331069bfe2062edb26764eb3cb34f21096de31042"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.6/oauth-mux-aarch64-linux.tar.gz"
      sha256 "390691cf9c01a0435ba90e814bddabdf0d246a8190b56be1208fe63c43e4f96f"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.6/oauth-mux-x86_64-linux.tar.gz"
      sha256 "326027666fc1476e057ab0bb5b3ba100a2ac2b00128e8a40c22b87c685687e8b"
    end
  end

  def install
    bin.install "oauth-mux"
  end

  test do
    assert_match "oauth-mux", shell_output("#{bin}/oauth-mux version")
  end
end
