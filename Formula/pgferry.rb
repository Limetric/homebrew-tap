class Pgferry < Formula
  desc "Migrate MySQL, MariaDB, SQLite, or MSSQL databases to PostgreSQL"
  homepage "https://www.pgferry.com"
  version "6.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.1/pgferry-darwin-arm64"
      sha256 "a766670010e386534cf18f7786a31eaf2c86d8ca77c8ab209073e9847396faec"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.1/pgferry-darwin-amd64"
      sha256 "ed587c60bb7a083c595a47b3e15d3dee97bd39d075a18e262e5e3514e66eb8bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.1/pgferry-linux-arm64"
      sha256 "169c530374e51696f72c36d0ce0d888ef3c71b945ad240f418fef6550562efcc"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.0.1/pgferry-linux-amd64"
      sha256 "bee2f6d29e389c8faac8f964c2ee5c5765f047961aad2b8554793c0713c1a3f1"
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
