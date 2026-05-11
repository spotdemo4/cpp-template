{
  description = "c++ template";

  nixConfig = {
    extra-substituters = [
      "https://nix.trev.zip"
    ];
    extra-trusted-public-keys = [
      "trev:I39N/EsnHkvfmsbx8RUW+ia5dOzojTQNCTzKYij1chU="
    ];
  };

  inputs = {
    systems.url = "github:spotdemo4/systems";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    trevpkgs = {
      url = "github:spotdemo4/trevpkgs";
      inputs.systems.follows = "systems";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      trevpkgs,
      ...
    }:
    trevpkgs.libs.mkFlake (
      system: pkgs: {

        # nix develop [#...]
        devShells = {
          default = pkgs.mkShell {
            shellHook = pkgs.shellhook.ref;
            packages = with pkgs; [
              # c++
              clang-tools
              cmake
              gtest
              ninja

              # lint
              nixd
              nil

              # format
              nixfmt
              oxfmt
              treefmt

              # util
              bumper
            ];
          };

          bump = pkgs.mkShell {
            packages = with pkgs; [
              bumper
            ];
          };

          release = pkgs.mkShell {
            packages = with pkgs; [
              flake-release
            ];
          };

          update = pkgs.mkShell {
            packages = with pkgs; [
              renovate
            ];
          };

          vulnerable = pkgs.mkShell {
            packages = with pkgs; [
              flake-checker # nix
              zizmor # actions
            ];
          };
        };

        # nix run [#...]
        apps = pkgs.mkApps {
          dev = "cmake --build build && ./build/main";
          configure = "cmake -S . -B build -G Ninja";
        };

        # nix build [#...]
        packages = {
          default = pkgs.stdenv.mkDerivation (
            final: with pkgs.lib; {
              pname = "cpp-template";
              version = "0.1.0";

              src = fileset.toSource {
                root = ./.;
                fileset = fileset.unions [
                  ./.clang-format
                  ./.clang-tidy
                  ./.clangd
                  ./CMakeLists.txt
                  ./src
                  ./tests
                ];
              };

              nativeBuildInputs = with pkgs; [
                cmake
              ];
              buildInputs = with pkgs; [
                gtest
              ];

              nativeCheckInputs = with pkgs; [
                clang-tools
              ];
              checkPhase = ''
                pushd ..

                clang-format --dry-run --Werror $(find src -name '*.cpp' -o -name '*.hpp')
                clang-tidy -p build $(find src -name '*.cpp' -o -name '*.hpp')
                ctest --test-dir build

                popd
              '';

              meta = {
                mainProgram = "cpp-template";
                description = "c++ template";
                license = licenses.mit;
                platforms = platforms.all;
                homepage = "https://github.com/spotdemo4/cpp-template";
                changelog = "https://github.com/spotdemo4/cpp-template/releases/tag/v${final.version}";
                downloadPage = "https://github.com/spotdemo4/cpp-template/releases/tag/v${final.version}";
              };
            }
          );
        };

        # nix build #images.[...]
        images = {
          default = pkgs.mkImage {
            src = self.packages.${system}.default;
          };
        };

        # nix fmt
        formatter = pkgs.treefmt.withConfig {
          configFile = ./treefmt.toml;
          runtimeInputs = with pkgs; [
            nixfmt
            oxfmt
          ];
        };

        # nix flake check
        checks = pkgs.mkChecks {
          cpp = self.packages.${system}.default;

          nix = {
            root = ./.;
            filter = file: file.hasExt "nix";
            packages = with pkgs; [
              nixfmt
            ];
            script = ''
              nixfmt --check "$file"
            '';
          };

          actions = {
            root = ./.github/workflows;
            filter = file: file.hasExt "yaml";
            packages = with pkgs; [
              action-validator
              zizmor
            ];
            script = ''
              action-validator "$file"
              zizmor --offline "$file"
            '';
          };

          renovate = {
            root = ./.github;
            files = ./.github/renovate.json;
            packages = with pkgs; [
              renovate
            ];
            script = ''
              renovate-config-validator renovate.json
            '';
          };

          config = {
            root = ./.;
            filter = file: file.hasExt "json" || file.hasExt "yaml" || file.hasExt "toml" || file.hasExt "md";
            packages = with pkgs; [
              oxfmt
            ];
            script = ''
              oxfmt --check
            '';
          };
        };
      }
    );
}
