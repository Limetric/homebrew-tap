class Ads < Formula
  desc "Ad platform management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "1.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v1.2.1/ads-darwin-arm64"
      sha256 "4e43c12f9accda80ebddc173fcf9de836b0ebf880081cebf3cd312c63d5df725"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.2.1/ads-darwin-amd64"
      sha256 "644d2e0ad88f6936c2d509acc6dd01def8efedae288e1c94ed349e561f37b83f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v1.2.1/ads-linux-arm64"
      sha256 "4d22aa3438cc0a7b0ad93bfb888ddd0d697effad4926401167fbf65cf9118fb6"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v1.2.1/ads-linux-amd64"
      sha256 "6712c32331f1b02f8ff517c841e225e37feb4d1df5c9b68651e078ec10058f7b"
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
