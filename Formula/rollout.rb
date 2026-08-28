class Rollout < Formula
  desc "Google Play Console release management CLI and MCP server"
  homepage "https://github.com/Limetric/rollout"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/rollout/releases/download/v1.0.0/rollout-darwin-arm64"
      sha256 "9cd82f3eff99e79e14f8cfc77d744dc8d4622546e31b63b8daf6bb995dbfc728"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v1.0.0/rollout-darwin-amd64"
      sha256 "74c96e0b1cc40a182842dce295f444503ae806ef105e78924d82bf85effd2ccb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/rollout/releases/download/v1.0.0/rollout-linux-arm64"
      sha256 "ffd7734b1cf91cd1bba9cd98b4d70c2bfc773a99d416f52eeebfcca36e25fbad"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v1.0.0/rollout-linux-amd64"
      sha256 "46eb6afe84a38f6de1c3d0e5bba351615c42959de66307a550e3acb6e7e2756a"
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
