function _G.get_git_branch()
  if vim.b.gitsigns_head then
    return ' [' .. vim.b.gitsigns_head .. ']'
  end

  local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
  if branch ~= "" then
    return ' [' .. branch .. ']'
  else
    return ''
  end
end
