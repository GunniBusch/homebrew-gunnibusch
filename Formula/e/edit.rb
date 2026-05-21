class Edit < Formula
  desc "Tiny Unix editor launcher for EDIT_EDITOR, VISUAL, EDITOR env or vi"
  homepage "https://github.com/GunniBusch/edit"
  url "https://github.com/GunniBusch/edit/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2e9361c63c38cd155857bb0fe1ea96628efa0d4bfb18e34c0778a6ef44f90591"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/GunniBusch/homebrew-gunnibusch/releases/download/edit-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "316cf94090774d9da4c7d8bd0b9cc3bc1dba99a4fe4d6761b696218de9b04d71"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "35714bb54bf2d4a943e15af52e1f4705f10ecc7367da37a519b5d58df8d0577f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "996ea4259b8eb9f1e708943c389be3d53eb488cac88e019eeb90f358ed6e4502"
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
