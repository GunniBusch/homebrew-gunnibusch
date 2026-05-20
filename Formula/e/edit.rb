class Edit < Formula
  desc "Tiny Unix editor launcher for EDIT_EDITOR, VISUAL, EDITOR env or vi"
  homepage "https://github.com/GunniBusch/edit"
  url "https://github.com/GunniBusch/edit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "26aa65f6d9168bf062dd7d0cdf35af15aa9bbecb518a85348c1b3937fbf095b0"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/GunniBusch/homebrew-gunnibusch/releases/download/edit-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "48990abe40501e3616dac1e5b689a61547629c0c0d8ae1839880dc5608132bd1"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "05a2d169af5d07ced18574969edfa824ea1f8f80527a4373bce1ba04507c2a51"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "310be9e5e4fea34628d214204297c8cf32b6478040fcd05c0e7144119b54afe6"
  end

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
