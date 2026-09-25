# contributing

## requirements

- [nix](https://nixos.org/)

## getting started

```sh
nix develop
```

with [direnv](https://direnv.net/):

```sh
ln -s .envrc.project .envrc
direnv allow
```

configure the build:

```sh
cmake -S . -B build -G Ninja
```

### run

```sh
nix run
```

with [cmake](https://cmake.org/):

```sh
cmake --build build && ./build/cpp-template
```

### format

```sh
nix fmt
```

with [clang-format](https://clang.llvm.org/docs/ClangFormat.html):

```sh
clang-format -i src/*.cpp tests/*.cpp
```

### check

```sh
nix flake check
```

with [ctest](https://cmake.org/cmake/help/latest/manual/ctest.1.html):

```sh
cmake --build build
ctest --test-dir build --output-on-failure
```

### build

```sh
nix build
```

with [cmake](https://cmake.org/):

```sh
cmake --build build
```

### release

with [bumper](https://trev.zip/llc/bumper):

```sh
bumper
```

releases are created automatically for [significant](https://www.conventionalcommits.org/en/v1.0.0/#summary) changes
