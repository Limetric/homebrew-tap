class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.5.0/ads-darwin-arm64"
      sha256 "2c285e2015ae9c7cd2d1cacd8310245bd5323a695b260a4256a1cb03ab1492df"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.5.0/ads-darwin-amd64"
      sha256 "7aa8f1528b8c2e268f60544292c117f971ace919315647c5793b34488df194c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.5.0/ads-linux-arm64"
      sha256 "67734d240bd4ec9535a26aeaf5532d46d70defd2596a42c04f71fd96411760b1"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.5.0/ads-linux-amd64"
      sha256 "7e55a63323e06ebabeeb12f54c072cc0b292252a23f4049f77c8213f6fd4d960"
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
