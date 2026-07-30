class FuzzyTable < Formula
  desc "Interactive terminal UI for fuzzy-picking a row from a CSV"
  homepage "https://github.com/connorwyatt/fuzzy-table"
  url "https://github.com/connorwyatt/fuzzy-table/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "16644ae144d61cb6bdd5b5ec51e80d6f1c2a5cadc8c0799870cc144539aa8e2d"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe"
    bin.install "zig-out/bin/fuzzy-table"
  end

  test do
    assert_match "Usage: fuzzy-table", shell_output("#{bin}/fuzzy-table --help")
  end
end
