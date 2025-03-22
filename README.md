# buf-sweep.nvim

A Neovim plugin to sweep Vim buffers.

Inspired by [BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim).

## Installation

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "h3pei/buf-sweep.nvim" }
```

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug "h3pei/buf-sweep.nvim"
```

## Usage

`buf-sweep.nvim` provides just two command `:BufSweep` and `:BufSweep!`.

- `:BufSweep` deletes all buffers except the current buffer. But buffers with unsaved changes are not deleted.
- `:BufSweep!` deletes all buffers except the current buffer, even if there are unsaved changes.
