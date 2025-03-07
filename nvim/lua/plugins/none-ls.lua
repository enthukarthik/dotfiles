-- Format on save and linters
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    local formatters = {
      "stylua", -- lua formatter
      "shfmt", -- bash shell formatter
      "prettier", -- for html, json, yaml, markdown
    }

    if vim.fn.has("win32") ~= 1 then
      vim.list_extend(formatters, {
        "checkmake", -- for Makefile. This linter is not available in win32
      })
    end

    -- list of formatters & linters for mason to install
    require("mason-null-ls").setup({
      ensure_installed = formatters,
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    })

    local sources = {
      formatting.stylua,
      formatting.shfmt.with({ args = { "-i", "4" } }), -- format with indentation of 4 spaces
      formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
    }

    if vim.fn.has("win32") ~= 1 then
      vim.list_extend(sources, {
        diagnostics.checkmake,
      })
    end

    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
    ---@param client vim.lsp.Client
    ---@param method string
    ---@param bufnr? integer some lsp support methods only in specific files
    ---@return boolean
    local function client_supports_method(client, method, bufnr)
      if vim.fn.has("nvim-0.11") == 1 then
        ---@diagnostic disable-next-line
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client_supports_method(client, vim.lsp.protocol.Methods.textDocument_formatting, bufnr) then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
