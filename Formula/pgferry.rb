class Pgferry < Formula
  desc "Migrate MySQL, MariaDB, SQLite, or MSSQL databases to PostgreSQL"
  homepage "https://www.pgferry.com"
  version "6.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.3/pgferry-darwin-arm64"
      sha256 "67c0921eee96efb0c293b5d6eb59a9731c51d75475c29d86096e26a465fccce3"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.3/pgferry-darwin-amd64"
      sha256 "50ef9769b08b382cf14de899cade7de3f5710d8d2d539eeab60c4515779deb50"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.3/pgferry-linux-arm64"
      sha256 "ee97abdc9d57d53bd43a6509a75555295e11cd3ea774309dbe3ad54b292baf12"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.3/pgferry-linux-amd64"
      sha256 "6026960befdce438656d1642223889916f4f2d1f1422b3a4d9301134ae95f9e4"
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
