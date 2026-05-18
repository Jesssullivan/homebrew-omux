class OauthMux < Formula
  desc "OAuth fallback muxing for AI harness subscriptions"
  homepage "https://omux.xoxd.ai"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.9/oauth-mux-aarch64-macos.tar.gz"
      sha256 "e38f4b7d442ef5f9b2e285705fc464f8294aaf690785aba73887e14e2ebdf7b0"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.9/oauth-mux-x86_64-macos.tar.gz"
      sha256 "9e6ff399d5653ffd9f2c078b63b1f9ae0e39d0379aec6c9928c5a46a4709cc98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.9/oauth-mux-aarch64-linux.tar.gz"
      sha256 "f970a49de7f3022b70c9e0a6d77e5e99001dc9768b720688d3b1f5cdb6da121b"
    else
      url "https://github.com/Jesssullivan/oauth-mux/releases/download/v0.1.9/oauth-mux-x86_64-linux.tar.gz"
      sha256 "b8b9dcb2bf5b12e8787159b708e00116d62cb6a9c41e520502b4e37c33395bbe"
    end
  end

  def install
    bin.install "oauth-mux"
    bin.install "codex"
  end

  test do
    assert_match "oauth-mux", shell_output("#{bin}/oauth-mux version")
    assert_match "OMUX_CODEX_SHIM", shell_output("grep OMUX_CODEX_SHIM #{bin}/codex")
    native = testpath/"native-codex"
    native.write <<~EOS
      #!/bin/sh
      case "$1" in
        --version) echo "native-codex-stub 0.0.0" ;;
        *) echo "native-codex-stub" ;;
      esac
    EOS
    chmod 0755, native
    assert_match "native-codex-stub 0.0.0", shell_output("OMUX_CODEX_BIN=#{native} #{bin}/codex --version")
  end
end
