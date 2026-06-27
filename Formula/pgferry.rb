class Pgferry < Formula
  desc "Migrate MySQL, MariaDB, SQLite, or MSSQL databases to PostgreSQL"
  homepage "https://www.pgferry.com"
  version "6.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.2/pgferry-darwin-arm64"
      sha256 "73a201d3db3231c44622cba7b99cefe858e54569b351b003a17d3714bdc90d83"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.2/pgferry-darwin-amd64"
      sha256 "c1842851a89cb49f95fc3f699b1b4c22b98bb465908dd3cabe826518458c580d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.2/pgferry-linux-arm64"
      sha256 "562c5d131a3cc5aa8dead43058ee890b9af36fbbaa3be2c6f0c3e0d48b012679"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.2/pgferry-linux-amd64"
      sha256 "72066ae4cfdca02a40e9496577c9b46e889e659058b4bbb33d91a2748d08c8c6"
    end
  end

  def install
    binary = Dir["pgferry-*"].first
    chmod 0755, binary
    bin.install binary => "pgferry"
  end

  test do
    system "#{bin}/pgferry", "version"
  end
end
