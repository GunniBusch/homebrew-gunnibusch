class Edit < Formula
  desc "Tiny Unix editor launcher for EDIT_EDITOR, VISUAL, EDITOR env or vi"
  homepage "https://github.com/GunniBusch/edit"
  url "https://github.com/GunniBusch/edit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "26aa65f6d9168bf062dd7d0cdf35af15aa9bbecb518a85348c1b3937fbf095b0"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    ENV["EDIT_EDITOR"] = "/bin/cat"
    (testpath/"test.txt").write("Hello, World!")
    assert_equal "Hello, World!", shell_output("#{bin}/edit #{testpath}/test.txt")
  end
end
