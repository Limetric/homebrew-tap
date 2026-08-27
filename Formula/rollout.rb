class Rollout < Formula
  desc "Google Play Console release management CLI and MCP server"
  homepage "https://github.com/Limetric/rollout"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/rollout/releases/download/v0.2.0/rollout-darwin-arm64"
      sha256 "f7b4162c1f84f103d6aaf1212f82e7226d6e7d3806d8bd69bb7b96049af0d692"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v0.2.0/rollout-darwin-amd64"
      sha256 "bbe238b9987fe32024025b2f0baf9161f2e901bb1f8f379cc559e10a372c634f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/rollout/releases/download/v0.2.0/rollout-linux-arm64"
      sha256 "be1db8e70e93562f26cf993750d526dace254d34c602773cda233d4a4f0b559e"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v0.2.0/rollout-linux-amd64"
      sha256 "110ea36ed51a0d8885919c228db9eb825f06e07733f9cdb34b77dcfdc818c346"
    end
  end

  def install
    binary = Dir["rollout-*"].first
    chmod 0755, binary
    bin.install binary => "rollout"
    generate_completions_from_executable(bin/"rollout", "completion")
  end

  test do
    system "#{bin}/rollout", "version"
  end
end
