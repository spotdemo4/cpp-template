# c++ template

[![check](https://trev.zip/template/cpp/actions/workflows/check.yaml/badge.svg?branch=main&logo=forgejo&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://trev.zip/template/cpp/actions?workflow=check.yaml)
[![vulnerable](https://trev.zip/template/cpp/actions/workflows/vulnerable.yaml/badge.svg?branch=main&logo=forgejo&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://trev.zip/template/cpp/actions?workflow=vulnerable.yaml)
[![cpp](<https://img.shields.io/badge/dynamic/regex?url=https://trev.zip/template/cpp/raw/branch/main/CMakeLists.txt&search=set%5C(CMAKE_CXX_STANDARD%20(.*%3F)%5C)&replace=C%2B%2B%241&logo=cplusplus&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%2300599C>)](https://isocpp.org/std/status)

template for [C++](https://isocpp.org/)

part of [spotdemo4/templates](https://github.com/spotdemo4/templates)

## requirements

- [nix](https://nixos.org/)

## getting started

```sh
nix develop && nix run .#configure
```

### run

```sh
nix run .#dev
```

### format

```sh
nix fmt
```

### check

```sh
nix flake check
```

### build

```sh
nix build
```

### release

```sh
bumper
```

releases are created automatically for [significant](https://www.conventionalcommits.org/en/v1.0.0/#summary) changes

## use

### docker

```sh
docker run trev.zip/template/cpp:latest
```

### nix

```sh
nix run git+https://trev.zip/template/cpp.git
```

### download

https://trev.zip/template/cpp/releases
