class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v1.3.0/ads-darwin-arm64"
      sha256 "2e0f5dfcd868c83b501afc9b3ad113d38559827755f749d5b0bb61dc064cf6e9"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.3.0/ads-darwin-amd64"
      sha256 "1fd724b7975b60825c68a81c3e615a201ab82cf51ceffd62d9c1d199410511ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v1.3.0/ads-linux-arm64"
      sha256 "2224b56ae347a87cd82c0ebb3b9d708c1e3ec291a713b07a75f422ac382106ee"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.3.0/ads-linux-amd64"
      sha256 "783fa4133954f0c41caa47f5a21b873a4441006abeb7373347b358e699885215"
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
