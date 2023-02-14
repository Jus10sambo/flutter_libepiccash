# flutter_libepiccash

An Epic Cash plugin in Dart for Flutter


## Build
Install Rust: https://www.rust-lang.org/tools/install

Install cargo ndk: `cargo install cargo-ndk`

### Android
```
rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android

sudo apt-get install libc6-dev-i386

# https://github.com/EpicCash/epic/blob/master/doc/build.md#requirements
sudo apt install build-essential cmake git libgit2-dev clang libncurses5-dev libncursesw5-dev zlib1g-dev pkg-config llvm
sudo apt-get install build-essential debhelper cmake libclang-dev libncurses5-dev clang libncursesw5-dev cargo rustc opencl-headers libssl-dev pkg-config ocl-icd-opencl-dev

cd scripts/android
./install_ndk.sh
./build_all.sh
```

### iOS:

```
rustup target add aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim

cargo install cargo-lipo
cargo install cbindgen

cd scripts/ios
./build_all
```

### Linux:

```
cd scripts/linux
./build_all.sh
```

### Windows:

Cross compile:
```
cd scripts/windows
./build_all.sh
```

Native build:
```
cd scripts/windows
./build_all.ps1
```

## Test
Run `flutter test`

## Usage
See [Stack Wallet](https://github.com/cypherstack/stack_wallet) and [Epic Pay](https://github.com/cypherstack/epic-mobile)
