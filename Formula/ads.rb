class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v1.3.1/ads-darwin-arm64"
      sha256 "8aa41ddd3829335f872453cf84f39e7bb37917adff5f643dfa10f229519f68fd"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.3.1/ads-darwin-amd64"
      sha256 "23a65b63ce028e2df6c891d76ee77232f8c6f7d976cd04eed83989745412cc8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v1.3.1/ads-linux-arm64"
      sha256 "89a32cde133ed2e2f5fa048c44b332309ab02be7dd37723f53c7d359477ddca9"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.3.1/ads-linux-amd64"
      sha256 "743645fc63f8298d156a79e44fc8f43df321ecb25c5493934f43e678129ec937"
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
