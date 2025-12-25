return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    --layout
    local function center_layout()
      local win_height = vim.fn.winheight(0)

      -- dashboard içeriğinin yaklaşık satır sayısı
      local content_height = 16

      local padding = math.max(2, math.floor((win_height - content_height) / 2))

      return {
        { type = "padding", val = padding },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }
    end

     dashboard.config.layout = center_layout()
    -- HEADER (ASCII LOGO)
    dashboard.section.header.val = {
      "",
      "",
      "",
      "",
      "  ███  █████                       ████████ ",
      " ░░░  ░░███                       ███░░░░███",
      " ████  ░███████   █████████████  ░░░    ░███",
      "░░███  ░███░░███ ░░███░░███░░███    ██████░ ",
      " ░███  ░███ ░███  ░███ ░███ ░███   ░░░░░░███",
      " ░███  ░███ ░███  ░███ ░███ ░███  ███   ░███",
      " █████ ████ █████ █████░███ █████░░████████ ",
      "░░░░░ ░░░░ ░░░░░ ░░░░░ ░░░ ░░░░░  ░░░░░░░░  ",
      "",
      "",
      "                 Dashboard",
      "",
      "",
    }

    -- BUTTONS
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "󰊢  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa <CR>"),
    }

    -- FOOTER
    local function footer()
      local datetime = os.date(" %d-%m-%Y   %H:%M")
      return datetime .. "  |  Ready to code"
    end

    dashboard.section.footer.val = {
      "",
      "",
      footer(),
    }

    -- LAYOUT
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- OPTIONS
    dashboard.config.opts.noautocmd = true

    -- SETUP
    alpha.setup(dashboard.config)

    -- Açılışta boş buffer varsa kapat
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.cmd("set showtabline=0")
      end,
    })
  end,
}
