# c++ template

[![check](https://trev.zip/template/cpp/actions/workflows/check.yaml/badge.svg?branch=main&logo=forgejo&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://trev.zip/template/cpp/actions?workflow=check.yaml)
[![vulnerable](https://trev.zip/template/cpp/actions/workflows/vulnerable.yaml/badge.svg?branch=main&logo=forgejo&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://trev.zip/template/cpp/actions?workflow=vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://trev.zip/template/cpp/raw/branch/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![cpp](<https://img.shields.io/badge/dynamic/regex?url=https://trev.zip/template/cpp/raw/branch/main/CMakeLists.txt&search=set%5C(CMAKE_CXX_STANDARD%20(.*%3F)%5C)&replace=C%2B%2B%241&logo=cplusplus&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%2300599C>)](https://isocpp.org/std/status)

template for [C++](https://isocpp.org/)

to initialize a new project, run:

```sh
./init.sh "Title" "Description"
```

part of [spotdemo4/templates](https://github.com/spotdemo4/templates)

## using

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

## contributing

see [CONTRIBUTING.md](CONTRIBUTING.md) for requirements and getting started
