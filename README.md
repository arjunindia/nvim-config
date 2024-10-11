# Arjun's Neovim Config

- This is my personal neovim config. 
- This config is derived from [NvChad's TinyVim](https://github.com/NvChad/tinyvim)

# Installation

- Clone this repo

```bash
git clone https://github.com/arjunindia/nvim-config.git --depth=1 ~/.config/nvim && nvim
```

- Make sure to run :MasonInstallAll command after lazy.nvim finishes downloading plugins

```bash
:MasonInstallAll
```
# Screenshots

![2024-09-25-230851](https://raw.githubusercontent.com/arjunindia/nvim-config/refs/heads/main/screenshots/Screenshot_20240925_230851.png)
![2024-09-25-230927](https://raw.githubusercontent.com/arjunindia/nvim-config/refs/heads/main/screenshots/Screenshot_20240925_230927.png)
![2024-09-25-233205](https://raw.githubusercontent.com/arjunindia/nvim-config/refs/heads/main/screenshots/Screenshot_20240925_233205.png)
![2024-09-25-233415](https://raw.githubusercontent.com/arjunindia/nvim-config/refs/heads/main/screenshots/Screenshot_20240925_233415.png)

# Dir structure
```bash
├── init.lua
├── lua
    ├── commands.lua
    ├── mappings.lua
    ├── options.lua
    └── plugins
        ├── init.lua
        ├── configs
            ├── cmp.lua
            ├── telescope.lua
            └── ( more ... )
```

# Important Plugins used
Below is the list of some very important plugins which I think should be must for any neovim config.

| Name             | Description                                  |
|-------------------------|----------------------------------------------|
| nvim-tree.lua           | File tree                                    |
| Nvim-web-devicons       | Icons provider                               |
| nvim-treesitter         | Configure treesitter                         |
| bufferline.nvim         | Tab + bufferline plugin                      |
| nvim-cmp                | Autocompletion                               |
| Luasnip & friendly snippets               | Snippets                                      |
| mason.nvim              | Download binaries of various lsps, formatters, debuggers, etc. |
| gitsigns.nvim                | Git-related features                         |
| comment.nvim            | Commenting                                   |
| telescope.nvim          | Fuzzy finder                                 |
| conform.nvim            | Formatter                                    |
| which-key.nvim          | Keybindings                                  |
| oil.nvim                | Netrw replacement                            |
| precognition.nvim       | Vim motions indicator                        |
| supermaven-nvim         | AI code completion                           |
| FTerm.nvim         | Terminal manager                             |
