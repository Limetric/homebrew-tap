class Goads < Formula
  desc "Google Ads campaign management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.2.0/goads-darwin-arm64"
      sha256 "80a3eeef5d9d305bfca6983616dc47d3174e7f48b3a5e8c36338d3c53e50b1e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.2.0/goads-darwin-amd64"
      sha256 "1b30d84deb134730db726ba765bb647bfdf834ad18bad8f7477c7d363431ff2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.2.0/goads-linux-arm64"
      sha256 "2fc38a5d3e2abd4c56a7b43f068937d76b96322504c8193e45408a90f156d32a"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.2.0/goads-linux-amd64"
      sha256 "6838ec25106efa9903ebc9c6592d9c30180908ebca0fa7404882711fddea6af9"
    end
  end

  def install
    binary = Dir["goads-*"].first
    chmod 0755, binary
    bin.install binary => "goads"
    generate_completions_from_executable(bin/"goads", "completion")
  end

  test do
    system "#{bin}/goads", "version"
  end
end
