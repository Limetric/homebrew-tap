class Rollout < Formula
  desc "Google Play Console release management CLI and MCP server"
  homepage "https://github.com/Limetric/rollout"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/rollout/releases/download/v0.3.0/rollout-darwin-arm64"
      sha256 "b9ae9dbff45d3daafc141f1d80d60763b33c1f1eed9ca5f0857aee053f551601"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v0.3.0/rollout-darwin-amd64"
      sha256 "6f9ef8dfea19d1ae402524edcdd840c3eb4b24a958e6b69f30087d5dda7b4d16"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/rollout/releases/download/v0.3.0/rollout-linux-arm64"
      sha256 "25d02a65cb757332eb96e4b5099a59fc89af0d5707643bd605d834f50b54a1ff"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v0.3.0/rollout-linux-amd64"
      sha256 "8027da5c9bfbce19a96297f2bd8a154da9831b47a503086953ea586e629aa59f"
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
