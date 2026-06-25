class Gfly < Formula
  include Language::Python::Virtualenv

  desc "Google Flights for agents - a read-only, JSON-first flight-search CLI"
  homepage "https://gfly.sh"
  url "https://files.pythonhosted.org/packages/4d/0e/462a954d5d3929b33e9624efa34f7e6653ecf7c0eb7778dd305d40e90b09/gfly-0.2.0.tar.gz"
  sha256 "dd60d815ec6a833556e07fe71f52a149cb752fcf3afbb5b2d23f8b1ea6cf2c5e"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "python@3.13"

  # Dependencies are pinned as WHEELS (no Rust/Cython/C++ build): primp and selectolax ship
  # cp313/abi3 wheels, protobuf uses its pure-Python wheel, the rest are universal. Each is
  # downloaded with :nounzip and pip-installed directly. keyring is intentionally omitted -
  # gfly's auth degrades gracefully to env / a 0600 file when keyring is absent, which keeps
  # cryptography out of the formula.
  resource "click" do
    url "https://files.pythonhosted.org/packages/c7/0d/67e5b4109ea4a837e80daa87c2c696711955e40449a97e8926672534def2/click-8.4.1-py3-none-any.whl", using: :nounzip
    sha256 "482be17c6991b8c19c5429a1e995d9b0efdbb63172824c41f99965dc0ade8ec2"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/18/67/36e9267722cc04a6b9f15c7f3441c2363321a3ea07da7ae0c0707beb2a9c/typing_extensions-4.15.0-py3-none-any.whl", using: :nounzip
    sha256 "f0fa19c6845758ab08074a0cfa8b7aecb71c999ca73d62883bc25cc018c4e548"
  end

  resource "airportsdata" do
    url "https://files.pythonhosted.org/packages/24/2e/cbf1b31fd5d069fb1d2c0f1142fde8bd515ad1a7d0272d05efff63c35eb4/airportsdata-20260315-py3-none-any.whl", using: :nounzip
    sha256 "22e03801468663fbee9a73e8864f25e3707acc1e43d0fc47586cc8c66365700a"
  end

  resource "fast-flights" do
    url "https://files.pythonhosted.org/packages/01/84/e7c835474aedcba37c310945dda03260e02d9b7d8f67dc5f1d84ba6b06a6/fast_flights-3.0.2-py3-none-any.whl", using: :nounzip
    sha256 "c04fd31621ecfd655358bccc9b3e3cf3c1df75c4747b0a4203ad7ec66f899dff"
  end

  resource "primp" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/58/c1/c965cc23f96a364803d44b4331f33e4465bb6f269add37e39d0ad77ffe33/primp-1.3.1-cp310-abi3-macosx_11_0_arm64.whl", using: :nounzip
        sha256 "27a8804eb9a3f641f379ee2b443591428cf85c898816e93d04d3e7b6f229ebcb"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/7f/80/c4885a783a7493e396d89a592ba19fce63ef6bd6ad47230924a884a30ec0/primp-1.3.1-cp310-abi3-macosx_10_12_x86_64.whl", using: :nounzip
        sha256 "27b87e6370045a0c65c0e4dfdfacbfe637387d05673ce8ddcce400263f7c27f0"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/9c/99/f4248d8d833d43fd8ba78208f2f4bf7fba7d3aec8c516090a95d18d6f550/primp-1.3.1-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", using: :nounzip
        sha256 "862974796552a51af8e276bb19c5d5e189168ab8bad216aef7ce3726a8d3b1dd"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/34/bb/9b66986b7ecf2eff987134cd94bde533142e3085d6f67531f1a369ceaaae/primp-1.3.1-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", using: :nounzip
        sha256 "329d0c320841f65b39d80801d8bae126732b84ec1094ca17b14fda0bda1b20ff"
      end
    end
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/19/c7/5f7c636ec43e0c545e28d1f1db71990108306f7bdcb89f069ba97e428e7f/protobuf-7.35.1-py3-none-any.whl", using: :nounzip
    sha256 "4bc97768d8fe4ad6743c8a19403e314511ed9f6d13205b687e52421c023ac1b9"
  end

  resource "selectolax" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/9a/10/0a2caaceda0c6cf226fe5e43f6d7b9134207cf61642bed651712c7599646/selectolax-0.4.10-cp313-cp313-macosx_11_0_arm64.whl", using: :nounzip
        sha256 "b43da45acece07f94e4b0d555e073f1a91314c98cb86d10860a1b291bc498976"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/37/88/f932da5e018dcec1fa4286414db4798afdd244fbf95a46ac79db018318e1/selectolax-0.4.10-cp313-cp313-macosx_10_13_x86_64.whl", using: :nounzip
        sha256 "3236fc0fbea9e237ee963274ebae700e68b9d6784bf91e0b3693eda63b393fa2"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/fb/d5/687dfb8c09110a5986a4f3f8e424b61c0f71716c5784077b76f02e4e81d7/selectolax-0.4.10-cp313-cp313-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", using: :nounzip
        sha256 "a5c80477a3a93f0ee350d832c6fc764cd2df1299914a816bcd5ed4f0c9701b9b"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/64/44/ac6011d2785f643baf3be4b8910e657e71427d37e41a15a513274b794425/selectolax-0.4.10-cp313-cp313-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", using: :nounzip
        sha256 "16055f712bd93507ce61ecac156bb7acf96b2e46c4d4d30c616e810f74f4da6e"
      end
    end
  end

  resource "hatchling" do
    url "https://files.pythonhosted.org/packages/56/49/2797ec0ef88008a653a8867bb8d1e5c223cd2df8e40390dd5c6a0279cbc5/hatchling-1.30.1-py3-none-any.whl", using: :nounzip
    sha256 "161eacafb3c6f91526e92116d21426369f2c36e98c36a864f11a96345ad4ee31"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/df/b2/87e62e8c3e2f4b32e5fe99e0b86d576da1312593b39f47d8ceef365e95ed/packaging-26.2-py3-none-any.whl", using: :nounzip
    sha256 "5fc45236b9446107ff2415ce77c807cee2862cb6fac22b8a73826d0693b0980e"
  end

  resource "pathspec" do
    url "https://files.pythonhosted.org/packages/f1/d9/7fb5aa316bc299258e68c73ba3bddbc499654a07f151cba08f6153988714/pathspec-1.1.1-py3-none-any.whl", using: :nounzip
    sha256 "a00ce642f577bf7f473932318056212bc4f8bfdf53128c78bbd5af0b9b20b189"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/54/20/4d324d65cc6d9205fabedc306948156824eb9f0ee1633355a8f7ec5c66bf/pluggy-1.6.0-py3-none-any.whl", using: :nounzip
    sha256 "e920276dd6813095e9377c0bc5566d94c932c33b27a3e3945d8389c374dd4746"
  end

  resource "trove-classifiers" do
    url "https://files.pythonhosted.org/packages/7c/a4/81502f486f01db95bc8320646a8a12511f5e556cb63d5e224d91816605c4/trove_classifiers-2026.6.1.19-py3-none-any.whl", using: :nounzip
    sha256 "ab4c4ec93cc4a4e7815fa759906e05e6bb3f2fbd92ea0f897288c6a43efd15b3"
  end

  def install
    virtualenv_create(libexec, "python3.13")

    # Install every dependency from its wheel (fast, no compilation). Each resource is a
    # :nounzip-staged .whl file; pip installs it with binaries allowed.
    resources.each do |r|
      r.stage do
        wheel = Dir["*.whl"].first
        system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "--no-warn-script-location", wheel
      end
    end

    # Build gfly itself from its sdist using the already-installed hatchling, with build
    # isolation OFF so pip never touches the network in the sandbox, and --no-deps so it does
    # not try to pull keyring.
    system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "--no-build-isolation", buildpath

    bin.install_symlink libexec/"bin/gfly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gfly --version")
    # offline checks - no network needed (airportsdata is bundled; schema is in-binary)
    assert_match "schemaVersion", shell_output("#{bin}/gfly airports search tokyo --json")
    assert_match "\"blocked\": 20", shell_output("#{bin}/gfly schema")
  end
end
