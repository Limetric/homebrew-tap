class Hostmux < Formula
  desc "Local host-based reverse proxy for development"
  homepage "https://github.com/Limetric/hostmux"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/hostmux/releases/download/v1.2.0/hostmux-darwin-arm64"
      sha256 "bd41b3431519664750e57677b90ab4014642482bc43664d3a6eb552adb642267"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/hostmux/releases/download/v1.2.0/hostmux-darwin-amd64"
      sha256 "50a7c193a709875c1f3e5e60f4aae532bc3dadf16b253aea9aaf76ba87409e4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/hostmux/releases/download/v1.2.0/hostmux-linux-arm64"
      sha256 "f5d8041f88bb73bf6b3705301f90c52380c78bfcd521c76a4d98836ef3472f50"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/hostmux/releases/download/v1.2.0/hostmux-linux-amd64"
      sha256 "c438bf6ee39a5f5e837300168c8b6852608721895f59ceed27aec16c9ea5f3de"
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
