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
