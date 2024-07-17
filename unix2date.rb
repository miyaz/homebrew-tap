class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.1.2'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.2/unix2date_0.1.2_darwin_arm64.tar.gz'
      sha256 '753ce375e20f5b2b873e0bc3e453aada7d10b8293e79a2502053b7b9b622a044'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.2/unix2date_0.1.2_darwin_amd64.tar.gz'
      sha256 '1279666384ec17525d8610fd079fb4b9a21dfb3c6609b2e4473b6392acda0a89'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.2/unix2date_0.1.2_linux_arm64.tar.gz'
      sha256 '76e07c92a8bf722cbf80297ec80648b349fb32f1ba36348acac1318e4a397680'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.2/unix2date_0.1.2_linux_amd64.tar.gz'
      sha256 'fd48f4233dfe6279e174af040eb5ebc1358562eabd0fcfa9c254d23a76a7fc46'
    end
  end

  head do
    url 'https://github.com/miyaz/unix2date.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath
      mkdir_p buildpath/'src/github.com/miyaz/unix2date'
      ln_s buildpath/'search', buildpath/'src/github.com/miyaz/unix2date/.'
      system 'go', 'build', '-o', 'unix2date'
    end
    bin.install 'unix2date'
  end
end
