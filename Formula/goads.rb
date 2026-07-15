class Goads < Formula
  desc "Google Ads campaign management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.1.1/goads-darwin-arm64"
      sha256 "e4e044e871e37ae79d4f438874b50ff9f823ff631168e93df010caee9d14f809"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.1.1/goads-darwin-amd64"
      sha256 "03f3b54a427f26cc7e636fff9d5cd50816e1870c4ddb118aa3571a9d57a55400"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.1.1/goads-linux-arm64"
      sha256 "f8d5343b3b47afb7748d13e3e28eae76b07994288a80eb169e7fb5637483562a"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.1.1/goads-linux-amd64"
      sha256 "b4db3dd9e0aa902c05ae442df9d57909460110a4501fe4e2f6304ad0dc25c20d"
    end
  end

  def install
    binary = Dir["goads-*"].first
    chmod 0755, binary
    bin.install binary => "goads"
  end

  test do
    system "#{bin}/goads", "version"
  end
end
