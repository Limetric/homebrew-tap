class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v1.0.0/ads-darwin-arm64"
      sha256 "69f29290f3d30409977dd337967f44ee6bfc392a2c998c10dda7d13b9158232f"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.0.0/ads-darwin-amd64"
      sha256 "8b540e7c2806f106d087e47d48982efd8d7ebd34c5dd73ad94c7fffe646224a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v1.0.0/ads-linux-arm64"
      sha256 "6264bfcfb2ffd23afabaf14b1b6f1986060750608a5c4c335d3188c905c43122"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.0.0/ads-linux-amd64"
      sha256 "07e62633e0435f17b73cb8e476be9ef40b46e386f1ac1f3b56557c280e687728"
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
