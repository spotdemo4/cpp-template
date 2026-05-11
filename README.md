# c++ template

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/cpp-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/cpp-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/cpp-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/cpp-template/actions/workflows/vulnerable.yaml)
[![flakehub](https://img.shields.io/endpoint?url=https://flakehub.com/f/spotdemo4/cpp-template/badge&labelColor=%23313244)](https://flakehub.com/flake/spotdemo4/cpp-template)

template for [C++](https://isocpp.org/)

part of [spotdemo4/templates](https://github.com/spotdemo4/templates)

## requirements

- [nix](https://nixos.org/)

## getting started

```elm
nix develop
nix run #configure
```

### run

```elm
nix run #dev
```

### format

```elm
nix fmt
```

### check

```elm
nix flake check
```

### build

```elm
nix build
```

### release

```elm
bumper "README.md"
```

releases are created automatically for [significant](https://www.conventionalcommits.org/en/v1.0.0/#summary) changes

## use

### download

| OS      | Architecture | Download                                                                                                                                        |
| ------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Linux   | amd64        | [cpp-template_0.1.0_linux_amd64](https://github.com/spotdemo4/cpp-template/releases/download/v0.1.0/cpp-template_0.1.0_linux_amd64)             |
| Linux   | arm64        | [cpp-template_0.1.0_linux_arm64](https://github.com/spotdemo4/cpp-template/releases/download/v0.1.0/cpp-template_0.1.0_linux_arm64)             |
| Linux   | arm          | [cpp-template_0.1.0_linux_arm](https://github.com/spotdemo4/cpp-template/releases/download/v0.1.0/cpp-template_0.1.0_linux_arm)                 |
| MacOS   | amd64        | [cpp-template_0.1.0_darwin_amd64](https://github.com/spotdemo4/cpp-template/releases/download/v0.1.0/cpp-template_0.1.0_darwin_amd64)           |
| MacOS   | arm64        | [cpp-template_0.1.0_darwin_arm64](https://github.com/spotdemo4/cpp-template/releases/download/v0.1.0/cpp-template_0.1.0_darwin_arm64)           |
| Windows | amd64        | [cpp-template_0.1.0_windows_amd64.exe](https://github.com/spotdemo4/cpp-template/releases/download/v0.1.0/cpp-template_0.1.0_windows_amd64.zip) |

### docker

```elm
docker run ghcr.io/spotdemo4/cpp-template:0.1.0
```

### nix

```elm
nix run github:spotdemo4/cpp-template
```
