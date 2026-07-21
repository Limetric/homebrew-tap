class Goads < Formula
  desc "Google Ads campaign management CLI and MCP server"
  homepage "https://github.com/Limetric/goads"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/goads/releases/download/v0.2.1/goads-darwin-arm64"
      sha256 "6a8725494a6bdb54dc0cac783f6add78157e9ba53f6e3ea10f7e44c019fca36b"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.2.1/goads-darwin-amd64"
      sha256 "bb034b0a9b5af2f64bfecf846c4cea90c98985ba46067736f8ff1c926d3356c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/goads/releases/download/v0.2.1/goads-linux-arm64"
      sha256 "298351e69b9494f09a17552e4d475207f7652a764f4f8675b09d97770ba22fbd"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/goads/releases/download/v0.2.1/goads-linux-amd64"
      sha256 "78b86befb6431e30169f9e49324441ee7eb7979b0a121faf1b2f3a47a6120dce"
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
