class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v1.1.0/ads-darwin-arm64"
      sha256 "9a37a515b57f10ff204364413784e59415fa20d468aa1743570346bd062b1d43"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.1.0/ads-darwin-amd64"
      sha256 "85ef6c36038b1651ab7d490701618d75f93171379842e91afda6fb296d556161"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v1.1.0/ads-linux-arm64"
      sha256 "2e5403674d8c8709045ceceb5aa41ca74fa6a449a325f14c8d05a6b7b437ed80"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.1.0/ads-linux-amd64"
      sha256 "2da4b7b9f4876d6150b2e1cb21348a75c1928a0789f82eaefef46ebceeaf0483"
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
