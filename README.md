# 🚀 Neovim Configuration for Web Development (WSL/Linux)

Cấu hình Neovim được tối ưu hóa cho **Web Development** (đặc biệt là
Pug, HTML, CSS, JavaScript).

- ⚡ Sử dụng **Lazy.nvim** để quản lý plugin\
- 🧠 Tích hợp **LSP** cho gợi ý code thông minh\
- 🌳 Dùng **Treesitter** để tô màu cú pháp chính xác\
- 🐧 Đã vá lỗi tương thích cho **WSL (Ubuntu 20.04 / 22.04)**\
- 🎨 Sửa lỗi hiển thị & indent cho **Pug**

---

## 🛠 1. Yêu cầu hệ thống (Prerequisites)

### A. Cài đặt Compiler & Tools

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential g++ make unzip ripgrep fd-find -y
sudo apt install nodejs npm -y
```

### B. Sửa lỗi GLIBC cho Treesitter (WSL)

```bash
sudo npm uninstall -g tree-sitter-cli
sudo npm install -g tree-sitter-cli@0.22.6
```

### C. Cài đặt Font (Windows)

1.  Tải JetBrainsMono Nerd Font (hoặc Hack Nerd Font)\
2.  Cài file `.ttf`\
3.  Chọn font trong Windows Terminal

---

## 📂 2. Cấu trúc thư mục

    ~/.config/nvim
    ├── init.lua
    ├── lua
    │   ├── config
    │   │   └── lazy.lua
    │   └── plugins
    │       ├── lsp-config.lua
    │       ├── treesitter.lua
    │       └── completions.lua
    ├── ftdetect
    │   └── pug.lua
    └── after
        └── ftplugin
            └── pug.lua

---

## ⚡ 3. Plugin chính

Plugin Chức năng

---

Lazy.nvim Quản lý plugin
Nvim-treesitter Syntax highlight
Mason Cài LSP server
Nvim-lspconfig Kết nối LSP
Nvim-cmp Auto-completion
LuaSnip Snippet
Emmet LS Emmet support

---

## ⌨️ 4. Keymaps

**Leader key = SPACE**

### Auto-completion

- `Tab` → Next suggestion / snippet jump\
- `Shift + Tab` → Previous suggestion\
- `Enter` → Confirm\
- `Ctrl + Space` → Trigger completion

### LSP

- `K` → Hover docs\
- `gd` → Go to definition\
- `<Space> + ca` → Code action\
- `<Space> + rn` → Rename

### Plugin Manager

- `:Lazy`
- `:Mason`
- `:checkhealth`

---

## 🐛 Troubleshooting

### File .pug không có màu

Chạy:

```vim
:TSInstall! pug
```

Restart Neovim.

### Lỗi GLIBC

Cài lại tree-sitter-cli@0.22.6.

### Emmet không hoạt động

Vào `:Mason` và cài `emmet-language-server`.

---

## ✨ Custom PUG Setup

- Indent 2 spaces\
- Comment dùng `//-`\
- Hỗ trợ class có dấu `-`\
- Highlight chuẩn Treesitter

---

Happy Coding 🚀
