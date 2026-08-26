class Rollout < Formula
  desc "Google Play Console release management CLI and MCP server"
  homepage "https://github.com/Limetric/rollout"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/rollout/releases/download/v0.1.0/rollout-darwin-arm64"
      sha256 "ebf16e91d23e45f72b1bd9dd110da248ccdcabc16fd26bd53f62d3e390f315bd"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v0.1.0/rollout-darwin-amd64"
      sha256 "0107fe3ce6d5411ec757c9b4555ca6576da6316ed823cf73ad0072e89fe9ab79"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/rollout/releases/download/v0.1.0/rollout-linux-arm64"
      sha256 "ac3739e2b735d1de0fa24e3011def2e45fdea5aded90ec97004885657cc3cae8"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/rollout/releases/download/v0.1.0/rollout-linux-amd64"
      sha256 "b89141bf521a5197a59af02fb836ae9989a89c3e3755d5490ffac235445afdc5"
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
