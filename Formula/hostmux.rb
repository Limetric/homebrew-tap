class Hostmux < Formula
  desc "Local host-based reverse proxy for development"
  homepage "https://github.com/Limetric/hostmux"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/hostmux/releases/download/v1.3.0/hostmux-darwin-arm64"
      sha256 "845f92b9a307f74f5dfeaf42047c90e3c0bd3e1f306c39cded3f8ef648b293ea"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/hostmux/releases/download/v1.3.0/hostmux-darwin-amd64"
      sha256 "7c93fb9f2fe954b1d1ba274df5880a8be8d711ccb1a387fdd8a39eafd8fa95e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/hostmux/releases/download/v1.3.0/hostmux-linux-arm64"
      sha256 "507941fbf0784feb9b47648c1e0f9769191ea1f9a382de7fcf0ca19a354bfa8e"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/hostmux/releases/download/v1.3.0/hostmux-linux-amd64"
      sha256 "0eb674309d3f2799dcae5db25ae98e5e237be84b69c9726ac4d35c66af76b1a4"
    end
  end

  def install
    binary = Dir["hostmux-*"].first
    chmod 0755, binary
    bin.install binary => "hostmux"
  end

  test do
    system "#{bin}/hostmux", "version"
  end
end
