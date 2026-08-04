class FuzzyTable < Formula
  desc "Interactive terminal UI for fuzzy-picking a row from a CSV"
  homepage "https://github.com/connorwyatt/fuzzy-table"
  url "https://github.com/connorwyatt/fuzzy-table/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8d25b5e82e337e07150056ee2cd5571e68b60ad4a7cc00a7e6e164d6e1e99b61"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe"
    bin.install "zig-out/bin/fuzzy-table"
  end

  test do
    assert_match "Usage: fuzzy-table", shell_output("#{bin}/fuzzy-table --help")
  end
end
