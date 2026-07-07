class Pgferry < Formula
  desc "Migrate MySQL, MariaDB, SQLite, or MSSQL databases to PostgreSQL"
  homepage "https://www.pgferry.com"
  version "6.0.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.4/pgferry-darwin-arm64"
      sha256 "d0d4bf191d88c4e24ef5d06782a6c750de19bbcf0defe80eef483244725bd1c3"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.4/pgferry-darwin-amd64"
      sha256 "5463f170a4bb1d0595b22a76934059a07c58ef11ad2777a4b8063d7a506662e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.4/pgferry-linux-arm64"
      sha256 "6dba1a1ab78e46856968f8e94203ee535a31bcc6c9d83dd5d21d5f82653a496a"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.4/pgferry-linux-amd64"
      sha256 "841d3865948184fd33f918a1df7e818ed6c5d217aebf3686213823a3fec81949"
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
