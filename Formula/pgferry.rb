class Pgferry < Formula
  desc "Migrate MySQL, MariaDB, SQLite, or MSSQL databases to PostgreSQL"
  homepage "https://www.pgferry.com"
  version "6.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Limetric/pgferry/releases/download/v6.1.0/pgferry-darwin-arm64"
      sha256 "a00797053ac71dc369773d7fb7d5d54af442f59d8cccf9559e99207059f731a7"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.1.0/pgferry-darwin-amd64"
      sha256 "16d715ed2f473d4ef166512970415f2023bdc36e0ff1d6271c0d39f6fbec29e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Limetric/pgferry/releases/download/v6.1.0/pgferry-linux-arm64"
      sha256 "76b0cbf735247b4ccf66be54e32935c2c6a22b482ced3bee58f88e8dfb8347f5"
    elsif Hardware::CPU.intel?
      url "https://github.com/Limetric/pgferry/releases/download/v6.1.0/pgferry-linux-amd64"
      sha256 "071b6f0c2939bdd025f5363197485320685e11cfe02beed74478f0005de9ad40"
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
