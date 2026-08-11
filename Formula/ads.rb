class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.3.0/ads-darwin-arm64"
      sha256 "5513d5ec7af124317dcfbb6d157254cd2ac6bf8dc53c25a5af11cd12356090c8"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.3.0/ads-darwin-amd64"
      sha256 "4c84e2bd40f1295510e90af288f554c7e08dd361012c1cc9504015dcc80b2fe5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.3.0/ads-linux-arm64"
      sha256 "a7f91238642c0ea67feaf2dcaac1348d1629977a335f939273aceaec4c545384"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.3.0/ads-linux-amd64"
      sha256 "33bf9160fa382e1c39229956ed621f58112052410ac9cd05918d735d84e5fcd0"
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
