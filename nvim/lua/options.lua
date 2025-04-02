-- lang
-- vim.cmd('language en_US.utf8') -- 表示言語を英語にする（Linux）
-- vim.cmd('language en_US') -- 表示言語を英語にする（Mac）

-- ファイル
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.helplang = "ja"
vim.opt.hidden = true

-- カーソルと表示
vim.opt.cursorline = true -- カーソルがある行を強調
-- vim.opt.cursorcolumn = true -- カーソルがある列を強調

-- クリップボード共有
vim.opt.clipboard:append({ "unnamedplus" })

-- メニューとコマンド
vim.opt.wildmenu = true -- コマンドラインで補完
vim.opt.cmdheight = 1 -- コマンドラインの表示行数
vim.opt.laststatus = 2 -- 下部にステータスラインを表示
vim.opt.showcmd = true -- コマンドラインに入力されたコマンドを表示

-- 検索・置換え
vim.opt.hlsearch = true -- ハイライト検索を有効
vim.opt.incsearch = true -- インクリメンタルサーチを有効
vim.opt.matchtime = 1 -- 入力された文字列がマッチするまでにかかる時間

-- カラースキーム
vim.opt.termguicolors = true -- 24 ビットカラーを使用
vim.opt.background = "dark" -- ダークカラーを使用する

-- インデント
vim.opt.shiftwidth = 4 -- シフト幅を4に設定する
vim.opt.tabstop = 4 -- タブ幅を4に設定する
vim.opt.expandtab = true -- タブ文字をスペースに置き換える
vim.opt.autoindent = true -- 自動インデントを有効にする
vim.opt.smartindent = true -- インデントをスマートに調整する

-- 表示
vim.opt.number = true -- 行番号を表示
vim.opt.relativenumber = true -- 相対行番号を表示
vim.opt.wrap = true -- テキストの自動折り返しを無効に
vim.opt.showtabline = 2 -- タブラインを表示
                        -- （1:常に表示、2:タブが開かれたときに表示）
vim.opt.visualbell = true -- ビープ音を表示する代わりに画面をフラッシュ
vim.opt.showmatch = true -- 対応する括弧をハイライト表示

-- インタフェース
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度
vim.opt.showtabline = 2 -- タブラインを表示する設定
-- vim.opt.signcolumn = "yes" -- サインカラムを表示

---- 行番号の色を変更（色は適宜変更してください）
vim.cmd("highlight LineNr guifg=#8a70ac")

-- カーソルの形状
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- 一般的なオプション設定
vim.opt.scrolloff = 8         -- スクロール時の上下の余白
vim.opt.sidescrolloff = 8     -- 左右スクロール時の余白
vim.opt.signcolumn = "yes"  -- signcolumnを常に表示
vim.opt.cursorline = true    -- カーソル行をハイライト
vim.opt.clipboard = "unnamedplus" -- システムクリップボードと連携 (+レジスタ)
vim.opt.splitbelow = true     -- 新しいウィンドウを下側に開く
vim.opt.splitright = true      -- 新しいウィンドウを右側に開く
vim.opt.mouse = "a"          -- マウスを有効化
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- キーマッピング (例)
vim.g.mapleader = " "       -- リーダーキーをスペースに設定
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- <leader>pv でファイルエクスプローラーを開く
vim.keymap.set("n", "<C-s>", ":w<CR>")           -- Ctrl+S で保存
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a")    -- 挿入モードで Ctrl+S で保存
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- Telescopeでファイル検索
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- TelescopeでGrep検索

