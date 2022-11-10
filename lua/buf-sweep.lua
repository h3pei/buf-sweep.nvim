local BufSweep = {}

---@param bufnr number
---@param options table
---@return boolean
local function is_sweepable(bufnr, options)
  if vim.api.nvim_get_current_buf() == bufnr then
    return false
  end

  if not vim.api.nvim_buf_get_option(bufnr, "buflisted") then
    return false
  end

  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return false
  end

  if vim.api.nvim_buf_get_option(bufnr, "modified") and not options.force then
    return false
  end

  return true
end

---@param message string
local function echo(message)
  vim.api.nvim_echo({ { "[buf-sweep.nvim] " .. message } }, true, {})
end

---@param options table|nil
function BufSweep.sweep(options)
  local options = options or {}

  local bufnrs = vim.api.nvim_list_bufs()
  if vim.tbl_isempty(bufnrs) then
    echo("No buffer exists")
    return
  end

  local sweep_count = 0
  for _, bufnr in pairs(bufnrs) do
    if is_sweepable(bufnr, options) then
      vim.api.nvim_buf_delete(bufnr, { force = options.force or false })
      sweep_count = sweep_count + 1
    end
  end

  echo(sweep_count .. " buffer(s) sweeped")
end

return BufSweep
