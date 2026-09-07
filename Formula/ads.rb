class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v1.2.0/ads-darwin-arm64"
      sha256 "4c0192170a1922226fc8d307f0e7ad616e53ddc382d594c6ddb0e096e7752d4a"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.2.0/ads-darwin-amd64"
      sha256 "138c9efbb856c31d3ae71d508db33f6993283c7abf9a5adf957d790c413095a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v1.2.0/ads-linux-arm64"
      sha256 "96e9dc93fabd6d179970e2532751aaaf3399224a85580116cf8bc84b5c8dbaeb"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.2.0/ads-linux-amd64"
      sha256 "c2072ae6061a650bf85bcee3238ae907bf2f804c922f19acee5b496bf991eb43"
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
