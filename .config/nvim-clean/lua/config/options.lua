vim.cmd[[
set syntax=on
set clipboard+=unnamedplus

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set conceallevel=0


command ToggleRelative lua ToggleRelative()
command ToggleTabWidth lua ToggleTabWidth()
command GGL lua GenerateGithubLink()

set number
set relativenumber
]]

-- Usefull for debugging the lsp
-- vim.cmd([[
--   let g:go_debug=['lsp']
-- ]])


function ToggleRelative()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
augroup("setIndent", { clear = true })
autocmd("Filetype", {
	group = "setIndent",
	pattern = {
		-- "xml",
		-- "html",
		-- "xhtml",
		-- "css",
		-- "scss",
		-- "javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		-- "yaml",
		"lua",
	},
	-- command = "setlocal shiftwidth=2 tabstop=2",
	callback = function()
		-- vim.b.autoformat = false
		vim.api.nvim_buf_set_option(0, "tabstop", 2)
		vim.api.nvim_buf_set_option(0, "shiftwidth", 2)
		vim.api.nvim_command('echo "Tab width set to 2"')
	end,
})

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

	-- Get the file name of the currently open buffer
	local file_name = vim.fn.expand("%")

	-- Get the line number of the current cursor position
	local line_number = vim.fn.line(".")

	-- Calculate the relative path of the file within the project root
	-- local relative_file = file_name:gsub("^" .. git_root, "")

	-- Construct the GitHub link
	local github_link = github_remote_url .. "/blob/main/" .. file_name .. "#L" .. line_number

	print("Yanking:\n", github_link)
	vim.fn.setreg("+", github_link)
	vim.fn.setreg("*", github_link)

	return github_link
end
