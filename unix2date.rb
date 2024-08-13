class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.3.0'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.0/unix2date_0.3.0_darwin_arm64.tar.gz'
      sha256 '4ee50e835f21c429bd4dfb0210ad728d0ea90e7e5056db6853836b48a6165b31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.0/unix2date_0.3.0_darwin_amd64.tar.gz'
      sha256 'ec63d0c2ef3a4424084378e795625cf62551a8573466f8cb8d5b9e9f47feb70e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.0/unix2date_0.3.0_linux_arm64.tar.gz'
      sha256 'de8253c20b4b38d0f852b74180a59bfde33b14ca17a0380f27591fe53676d1cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.0/unix2date_0.3.0_linux_amd64.tar.gz'
      sha256 '6e81b88c862034b6faa09dedc61bca9a8edfd3d1bb697adc9b5897653262c0a6'
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
