{ self, pkgs, lib, inputs, ... }:

{
  config = {
    programs.zed-editor = {
      enable = true;
      package = pkgs.zed-editor;
      extensions = [
        "basher"
        "codebook"
        "docker-compose"
        "dockerfile"
        "env"
        "golangci-lint"
        "gosum"
        "helm"
        "html"
        "hurl"
        "just"
        "nix"
        "pylsp"
        "python-refactoring"
        "ruff"
        "sql"
        "sqruff"
        "svelte"
        "terraform"
        "toml"
        "tree-sitter-query"
        "proto"
        "zed-react-ts-snippets"
        "nord"
        "bearded-icon-theme"
      ];

      userSettings = {
        icon_theme = "Bearded Icon Theme";
        ui_font_size = 13;
        buffer_font_size = 13;
        theme = {
          mode = "dark";
          light = "One Light";
          dark = "One Dark";
        };
        active_pane_modifiers = {
          inactive_opacity = 0.9;
          border_size = 1;
        };
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        features = {
          edit_prediction_provider = "copilot";
          copilot = true;
        };
        agent = {
          enabled = false;
          version = "1";
        };
        format_on_save = "on";
        autosave = { after_delay = { milliseconds = 1000; }; };
        auto_update = false;
        load_direnv = "shell_hook";
        current_line_highlight = "gutter";
        tabs = {
          file_icons = true;
          git_status = true;
        };
        soft_wrap = "editor_width";
        vim_mode = true;
        vim = {
          use_smartcase_find = true;
          use_multiline_find = true;
          toggle_relative_line_numbers = true;
        };
        diagnostic = {
          button = true;
          include_warnings = true;
          inline = {
            enabled = true;
            update_debounce_ms = 150;
            padding = 4;
            min_column = 0;
            max_severity = null;
          };
          cargo = null;
        };
        lsp = {
          gopls = {
            initialization_options = {
              buildFlags = [ ];
              directoryFilters = [ ];
              codelenses = {
                generate = true;
                regenerate_cgo = true;
                run_govulncheck = false;
                tidy = true;
                upgrade_dependency = true;
                vendor = true;
              };
              hints = {
                assignVariableTypes = true;
                compositeLiteralFields = true;
                compositeLiteralTypes = true;
                constantValues = true;
                functionTypeParameters = true;
                parameterNames = true;
                rangeVariableTypes = true;
              };
              analyses = { shadow = true; };
            };
          };
          pylsp = { binary.path_lookup = true; };
          ruff = {
            initialization_options = { settings = { lineLength = 120; }; };
          };
          nil = {
            binary.path = lib.getExe pkgs.nil;
            initialization_options = {
              formatting.command = [ "nixpkgs-fmt" ];
            };
          };
          vtsls = {
            settings = {
              typescript = { tsserver = { maxTsServerMemory = 16184; }; };
            };
          };
        };
        languages = {
          Python = {
            language_servers =
              [ "pylsp" "ruff" "python-refactoring" "!pyright" "..." ];
            format_on_save = "on";
            formatter = [
              { language_server = { name = "ruff"; }; }
              {
                code_actions = {
                  "source.fixAll.ruff" = true;
                  "source.organizeImports.ruff" = true;
                };
              }
            ];
          };
          Nix = { language_servers = [ "nil" "!nixd" "..." ]; };
        };
      };
    };

    xdg.configFile."zed/tasks.json".text = builtins.toJSON [
      # Example hardcoded tasks:
      {
        label = "build";
        command = "go build ./...";
      }
    ];

    home.packages = with pkgs; [
      inputs.gauntlet.packages."${system}".default
      ## EDITORS ##
      vscode
      micro
      code-cursor
      ## UTILS ##
      k9s
      lazygit
      lazydocker
      gitkraken
      nixpkgs-fmt
      warp-terminal
      tig
      diff-so-fancy
      tree
      nerd-fonts.meslo-lg
      lsd
      thunderbird
      sublime-merge
      obsidian
      nixfmt
      flyctl
      ## CORE ##
      gnumake
      cmake
      mmake
      eza
      bat
      bats
      fd
      delta
      dog
      duf
      ripgrep
      procs
    ];
  };
}
