local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local builtins = null_ls.builtins

local sources = {
  builtins.code_actions.eslint_d,
  builtins.diagnostics.actionlint,
  builtins.diagnostics.checkmake,
  builtins.diagnostics.eslint_d,
  builtins.diagnostics.hadolint,
  builtins.diagnostics.php,
  builtins.diagnostics.phpcs,
  builtins.diagnostics.phpstan,
  builtins.diagnostics.tsc,
  builtins.diagnostics.yamllint,
  builtins.diagnostics.zsh,
  builtins.formatting.eslint_d,
  builtins.formatting.fixjson,
  builtins.formatting.lua_format,
  builtins.formatting.phpcsfixer,
  builtins.formatting.trim_newlines,
  builtins.formatting.trim_whitespace,
}

null_ls.setup {
  debug = true,
  sources = sources,
} 
