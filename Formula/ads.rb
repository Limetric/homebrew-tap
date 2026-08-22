class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.4.0/ads-darwin-arm64"
      sha256 "e91725c6cc5d27d7372f52a39abeafdb4fd8e84d6def8aa49c8b17b2fd49a2b7"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.4.0/ads-darwin-amd64"
      sha256 "2a81672bde434404445675ae22d5db91afd1d2c5c9d2350a5d19ebc4e18f2a11"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.4.0/ads-linux-arm64"
      sha256 "6946fd5c6ed33bb97b03b0b54e10b28a5d4e43d5a1018b5d210c037d84544ffe"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.4.0/ads-linux-amd64"
      sha256 "80e4d26ab36f77b5874b0c741ce11d623b30d7b4b13083f8d19a655d4bc62343"
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
