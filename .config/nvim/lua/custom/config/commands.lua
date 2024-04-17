vim.cmd([[
  command ToggleRelative lua ToggleRelative()
  command ToggleTabWidth lua ToggleTabWidth()
  command GGL lua GenerateGithubLink()
  command GGLC lua GenerateGithubLinkCommit()
  command GoHeapYourself lua GoHeapYourself()
]])

function ToggleRelative()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

function ToggleTabWidth()
  local current_tab_width = vim.api.nvim_buf_get_option(0, "tabstop")

  if current_tab_width == 2 then
    vim.api.nvim_buf_set_option(0, "tabstop", 4)
    vim.api.nvim_buf_set_option(0, "shiftwidth", 4)
    vim.api.nvim_command('echo "Tab width set to 4"')
  elseif current_tab_width == 4 then
    vim.api.nvim_buf_set_option(0, "tabstop", 2)
    vim.api.nvim_buf_set_option(0, "shiftwidth", 2)
    vim.api.nvim_command('echo "Tab width set to 2"')
  else
    vim.api.nvim_command('echoerr "Invalid tab width"')
  end
end

function GenerateGithubLink()
  -- Get the Git root directory
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  -- Ensure the Git root directory ends with a slash
  if not string.match(git_root, "/$") then
    git_root = git_root .. "/"
  end

  -- Get the GitHub repository URL
  local github_remote_url = vim.fn.systemlist("git config --get remote.origin.url")[1]

  -- Remove the ".git" extension from the URL
  github_remote_url = string.gsub(github_remote_url, "%.git$", "")

  -- Convert the Git URL to a GitHub URL
  github_remote_url = string.gsub(github_remote_url, "git@github.com:", "https://github.com/")
  github_remote_url = string.gsub(github_remote_url, "git://github.com/", "https://github.com/")

  -- Get the current branch name
  local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]

  -- Get the upstream branch name if it exists
  -- local upstream_branch = vim.fn.systemlist("git rev-parse --abbrev-ref @{u}")[1]

  -- If an upstream branch exists, use it; otherwise, use the current branch
  -- local branch_name = upstream_branch ~= "" and upstream_branch or current_branch


  -- Get the file name of the currently open buffer
  local file_name = vim.fn.expand("%")

  -- Get the line number of the current cursor position
  local line_number = vim.fn.line(".")



  -- Construct the GitHub link
  local github_link = github_remote_url .. "/blob/" .. current_branch .. "/" .. file_name .. "#L" .. line_number

  print("Yanking:\n", github_link)
  vim.fn.setreg("+", github_link)
  vim.fn.setreg("*", github_link)

  return github_link
end



function GenerateGithubLinkCommit()
  -- Get the Git root directory
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  -- Ensure the Git root directory ends with a slash
  if not string.match(git_root, "/$") then
    git_root = git_root .. "/"
  end

  -- Get the GitHub repository URL
  local github_remote_url = vim.fn.systemlist("git config --get remote.origin.url")[1]

  -- Remove the ".git" extension from the URL
  github_remote_url = string.gsub(github_remote_url, "%.git$", "")

  -- Convert the Git URL to a GitHub URL
  github_remote_url = string.gsub(github_remote_url, "git@github.com:", "https://github.com/")
  github_remote_url = string.gsub(github_remote_url, "git://github.com/", "https://github.com/")

  -- Get the file name of the currently open buffer
  local file_name = vim.fn.expand("%")

  -- Get the line number of the current cursor position
  local line_number = vim.fn.line(".")


  -- Get the commit ID of the currently viewed state
  local commit_id = vim.fn.systemlist("git rev-parse HEAD")[1]

  -- Construct the GitHub link
  local github_link = github_remote_url .. "/blob/" .. commit_id .. "/" .. file_name .. "#L" .. line_number

  print("Yanking:\n", github_link)
  vim.fn.setreg("+", github_link)
  vim.fn.setreg("*", github_link)

  return github_link
end


function GoHeapYourself()
  print("Running \"go build -gcflags '-m -l' .\"")
  vim.cmd[[
    cgetexpr system("go build -gcflags '-m -l' .")
    copen
  ]]
end


-- Define a function to delete the line the cursor is on from the quickfix list
local function delete_from_qf_list(line_numbers)
  local quickfixList = vim.fn.getqflist()
  local currentWindow = vim.api.nvim_get_current_win()
  local current_line = vim.fn.line(".")

  if #quickfixList > 0 then
    -- Iterate over line numbers in reverse order to avoid skipping elements
    for i = #quickfixList, 1, -1 do
      for _, num in ipairs(line_numbers) do
        if i == num then
          -- Remove the line from the quickfix list
          table.remove(quickfixList, i)
          -- Adjust the current line if necessary
          if current_line > i then
            current_line = current_line - 1
          end
        end
      end
    end
  end

  -- Update the quickfix list
  vim.fn.setqflist(quickfixList)

  -- Set the cursor position to the updated current line
  vim.api.nvim_win_set_cursor(currentWindow, {current_line, 0})
end

-- Function to remove the current line or selected lines
function remove_lines()
  local mode = vim.fn.mode()
  local line_numbers = {}

  if mode == "n" then
    -- Normal mode, remove current line
    local current_line = vim.fn.line(".")
    table.insert(line_numbers, current_line)
  elseif mode:sub(1, 1) == "v" then
    -- Visual mode, remove selected lines
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    -- Print start and end line for debugging
    print("Start line:", start_line)
    print("End line:", end_line)
    -- Handle cases where end line is before start line
    local min_line = math.min(start_line, end_line)
    local max_line = math.max(start_line, end_line)
    for line = min_line, max_line do
      table.insert(line_numbers, line)
    end
  end

  delete_from_qf_list(line_numbers)
end

-- Create an autogroup for the quickfix keymaps
local qf_keymaps_group = vim.api.nvim_create_augroup("QfKeymaps", { clear = true })

-- Add autocommands to the group
vim.api.nvim_create_autocmd("FileType", {
  group = qf_keymaps_group,
  pattern = "qf",
  callback = function()
    -- vim.keymap.set("n", "dd", remove_lines, { buffer = true, desc = "Remove line from quickfix" })
    -- vim.keymap.set("v", "d", remove_lines, { buffer = true, desc = "Remove line from quickfix" })

    -- vim.keymap.nnoremap { 'dd', remove_lines, { silent = true, buffer = true, nowait = true } }
    -- vim.keymap.vnoremap { 'd', remove_lines, { silent = true, buffer = true, nowait = true } }

    vim.api.nvim_set_keymap('n', 'dd', '<cmd>lua remove_lines()<CR>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('v', 'd', '<cmd>lua remove_lines()<CR>', { noremap = true, silent = true })
    -- NOTE: this is the only way i got it to work lol 
    vim.api.nvim_set_keymap('v', 'd', ':<C-u>lua remove_lines()<CR>', { noremap = true, silent = true })
  end
})
