local M = {}

M.suda = function()
  vim.g.suda_smart_edit = true
end

M.blankline = function()
  vim.g.indent_blankline_char = "│" --""
  vim.g.indent_blankline_filetype_exclude = {
    "alpha",
    "help",
    "dashboard",
    "CHADTree",
    "terminal",
    "man",
    "packer",
    "NvimTree",
    "python",
  } -- indent-blankline breaks on python filetype
  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_show_trailing_blankline_indent = true
  vim.g.indent_blankline_show_current_context = true
  vim.wo.colorcolumn = "99999"
end

M.gitsigns = function()
  require("gitsigns").setup({})
end

M.colorizer = function()
  local colorizer = require("colorizer")

  colorizer.setup({
    "*",
  }, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes: foreground, background
    mode = "background", -- Set the display mode.
  })
end

M.true_zen = function()
  require("true-zen").setup({
    integrations = {
      twilight = true,
      lualine = true,
    },
  })

  Mapper.map(
    "n",
    "<leader>Za",
    "<cmd>TZAtaraxis<cr>",
    { noremap = true },
    "Zen",
    "zen_ataraxis",
    "Enable Ataraxis mode"
  )
  Mapper.map(
    "n",
    "<leader>Zm",
    "<cmd>TZMinimalist<cr>",
    { noremap = true },
    "Zen",
    "zen_minimalist",
    "Enable Minimalist mode"
  )
  Mapper.map("n", "<leader>Zf", "<cmd>TZFocus<cr>", { noremap = true }, "Zen", "zen_focs", "Enable foucs mode")
end

M.focus = function()
  require("focus").setup()
end

M.mundo = function()
  Mapper = require("utils").mapper()
  Mapper.map("n", "<leader>u", "<cmd>MundoToggle<cr>", { noremap = true }, "Mundo", "mundo_toggle", "Toggle Mundo")
end

M.glow = function()
  vim.g.glow_border = "rounded"
  -- vim.g.glow_width = 120
end

M.mapper = function()
  require("nvim-mapper").setup({
    -- do not assign the default keymap (<leader>MM)
    no_map = false,
    -- what should be done with the selected keybind when pressing enter.
    -- Available actions:
    --   * "definition" - Go to keybind definition (default)
    --   * "execute" - Execute the keybind command
    action_on_enter = "execute",
  })
end

M.signature = function()
  require("lsp_signature").setup({
    debug = false, -- set to true to enable debug logging
    log_path = "debug_log_file_path", -- debug log path
    verbose = false, -- show debug line number

    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

    floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
    -- will set to true when fully tested, set to false will use whichever side has more space
    -- this setting will be helpful if you do not want the PUM and floating win overlap
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = false, -- virtual hint enable
    use_lspsaga = false, -- set to true if you want to use lspsaga popup
    hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "rounded", -- double, rounded, single, shadow, none
    },

    always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

    auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
    extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

    padding = " ", -- character to pad on left and right of signature can be ' ', or '|'  etc

    transparency = nil, -- disabled by default, allow floating win transparent value 1~100
    shadow_blend = 36, -- if you using shadow as border use this set the opacity
    shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
    timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
    toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  })
end

M.snip = function()
  require("luasnip").config.set_config({
    updateevents = "TextChanged,TextChangedI",
  })
  require("luasnip/loaders/from_vscode").load()
end

return M
