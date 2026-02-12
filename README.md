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

### Lỗi thường gặp
1.  **Format bị timeout:** Vào `lua/plugins/formatting.lua` tăng `timeout_ms` lên 3000.
2.  **Không hiện gợi ý:** Gõ `:CmpStatus` để xem plugin có chạy không.
3.  **Lỗi icon ô vuông:** Cài font **JetBrainsMono Nerd Font** cho Terminal.

---

## ✨ Custom PUG Setup

- Indent 2 spaces\
- Comment dùng `//-`\
- Hỗ trợ class có dấu `-`\
- Highlight chuẩn Treesitter

---

## ⌨️ 1. Bảng Phím Tắt (Keymaps Cheat Sheet)

**Phím Dẫn (Leader Key):** `SPACE` (Dấu cách)
*Ghi chú: `<Leader>f` nghĩa là nhấn Dấu cách rồi nhấn phím f.*

### A. Code Intelligence (LSP - Thông minh nhất)
Dùng khi code báo lỗi hoặc muốn xem code nguồn.

| Phím Tắt | Lệnh tương ứng | Chức năng (Giải thích) |
| :--- | :--- | :--- |
| `K` | Hover | **Xem tài liệu:** Hiển thị thông tin type hoặc mô tả hàm ngay tại con trỏ. |
| `gd` | Go to Definition | **Nhảy tới nguồn:** Nhảy đến nơi biến/hàm được định nghĩa. |
| `<Space> + ca` | Code Action | **Sửa nhanh:** Hiển thị menu sửa lỗi (ví dụ: Import thiếu, sửa lỗi chính tả). |
| `<Space> + rn` | Rename | **Đổi tên:** Đổi tên biến/hàm ở tất cả các file trong dự án. |
| `<Space> + d` | Diagnostic | **Soi lỗi:** Xem chi tiết lỗi (đỏ/vàng) tại dòng hiện tại. |
| `[d` | Prev Diagnostic | Nhảy đến lỗi **trước đó**. |
| `]d` | Next Diagnostic | Nhảy đến lỗi **tiếp theo**. |

### B. Formatting (Làm đẹp code)
Dùng plugin `conform.nvim` + `prettier`.

| Phím Tắt | Chức năng |
| :--- | :--- |
| `<Space> + f` | **Format Code:** Tự động căn chỉnh thụt dòng, dấu chấm phẩy theo chuẩn Prettier. |
| *(Tự động)* | Code sẽ tự format khi bạn nhấn lưu (`:w`). |

### C. Auto-completion (Gợi ý code)
Dùng plugin `nvim-cmp` + `Luasnip`.

| Phím Tắt | Chức năng |
| :--- | :--- |
| `Tab` | Chọn gợi ý **tiếp theo** / Hoặc nhảy đến điểm nhập liệu tiếp theo trong Snippet. |
| `Shift + Tab` | Chọn gợi ý **trước đó**. |
| `Enter` | **Xác nhận** chọn gợi ý đang highlight. |
| `Ctrl + Space` | **Kích hoạt thủ công:** Ép menu gợi ý hiện ra (nếu nó chưa hiện). |
| `Ctrl + e` | **Đóng** menu gợi ý. |

### D. Quản lý hệ thống
| Lệnh (Gõ `:...`) | Chức năng |
| :--- | :--- |
| `:Lazy` | Mở trình quản lý Plugin (để update/cài mới). |
| `:Mason` | Mở trình quản lý LSP/Formatter (để cài html, cssls, prettier...). |
| `:checkhealth` | Kiểm tra sức khỏe toàn bộ Neovim (dùng khi gặp lỗi). |
| `:ConformInfo` | Xem log của trình format (dùng khi Prettier không chạy). |

---

## 🎓 2. Quá trình làm quen Neovim 

Neovim không dùng chuột. Để code nhanh bạn cần học thuộc các quy tắc di chuyển (Motions) và thao tác (Operators) sau.

### Cấp độ 1: Di chuyển cơ bản (Thay thế phím mũi tên)
* `h`, `j`, `k`, `l`: Trái, Xuống, Lên, Phải. (Luyện cho đến khi tay không còn sờ vào phím mũi tên).
* `w`: Nhảy đến đầu từ tiếp theo (Word).
* `b`: Nhảy về đầu từ phía trước (Back).
* `0`: Về đầu dòng.
* `$`: Về cuối dòng.
* `gg`: Về đầu file.
* `G`: Về cuối file.

### Cấp độ 2: Thao tác chỉnh sửa (Verbs)
* `i`: Vào chế độ sửa (Insert) tại con trỏ.
* `a`: Vào chế độ sửa (Insert) **sau** con trỏ (Append).
* `o`: Thêm dòng mới bên dưới và sửa.
* `u`: Hoàn tác (Undo).
* `Ctrl + r`: Làm lại (Redo).
* `dd`: Xóa (cắt) 1 dòng.
* `yy`: Copy 1 dòng.
* `p`: Dán (Paste) xuống dưới.

### Cấp độ 3: "Ngôn ngữ" của Vim (Text Objects) - **QUAN TRỌNG NHẤT**
Đây là sức mạnh thực sự. Công thức là: **[Hành động] + [Phạm vi] + [Đối tượng]**.

* **Thay đổi nội dung trong ngoặc/nháy:**
    * `ci"` (Change Inside Quotes): Xóa nội dung trong `""` và cho phép gõ mới.
    * `ci(`: Xóa nội dung trong `()`.
    * `ci{`: Xóa nội dung trong `{}`.
* **Thao tác với thẻ HTML/Pug:**
    * `cit` (Change Inside Tag): Xóa nội dung giữa 2 thẻ `<div>...</div>`.
    * `dat` (Delete Around Tag): Xóa luôn cả cặp thẻ bao quanh.
* **Thao tác với từ:**
    * `ciw` (Change Inner Word): Sửa từ hiện tại (không cần bôi đen).

### Ví dụ thực tế:
Giả sử có dòng code: `const name = "Nguyen Van A";`
* Muốn sửa tên? Di chuyển vào giữa tên -> Gõ `ci"` -> Nhập tên mới.
* Muốn đổi `const` thành `let`? Di chuyển vào chữ const -> Gõ `ciw` -> Nhập `let`.

---

Happy Coding 🚀
