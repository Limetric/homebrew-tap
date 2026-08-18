class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.3.1/ads-darwin-arm64"
      sha256 "eaf39997dd89048fd61c95cb0a8dea778b596302c30147947d6c9627d5107861"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.3.1/ads-darwin-amd64"
      sha256 "1b38ec94ad7f47cd6ccfcda166d855b504a6c91b2af2ba6efb69dafb981bdf8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.3.1/ads-linux-arm64"
      sha256 "a96cf8757eecb641534e43a0567e0fdbf3b09425cb3604e00fe6df63ec02d9d6"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.3.1/ads-linux-amd64"
      sha256 "46f87e541054fa234c4722453ae08fd9c32576c70f22d1a6ae9c0dcd7df7f118"
    end
  end

  def install
    binary = Dir["ads-*"].first
    chmod 0755, binary
    bin.install binary => "ads"
    generate_completions_from_executable(bin/"ads", "completion")
  end

  test do
    system "#{bin}/ads", "version"
  end
end
