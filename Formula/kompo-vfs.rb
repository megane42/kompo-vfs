class KompoVfs < Formula
  desc "Virtual filesystem library for kompo gem"
  homepage "https://github.com/megane42/kompo-vfs"
  url "https://github.com/megane42/kompo-vfs.git", using: :git, branch: "feature/fix-compile-error-on-mac"
  head "https://github.com/megane42/kompo-vfs.git", branch: "feature/fix-compile-error-on-mac"
  version "0.2.0"

  depends_on "rust" => :build

  def install
    system "cargo build --release"

    lib.install "target/release/libkompo_fs.a"
    lib.install "target/release/libkompo_wrap.a"
  end

  test do
    system "file", lib/"libkompo_fs.a"
    system "file", lib/"libkompo_wrap.a"
  end
end
