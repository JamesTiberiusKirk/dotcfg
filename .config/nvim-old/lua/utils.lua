local api = vim.api

local F = {}

function F.open_term_split()
  api.nvim_command('botright split new') -- split a new window
  win_handle = api.nvim_tabpage_get_win(0) -- get the window handler
  buf_handle = api.nvim_win_get_buf(0) -- get the buffer handler
  -- run your stuff here, could be anything
  jobID = api.nvim_call_function("termopen", {"$SHELL"})
  api.nvim_command('wincmd p') -- go back to previous window
end

function F.buff_run(cmd)
  api.nvim_command('vertical new') 
  api.nvim_command('set readonly') 
  api.nvim_command('file TestRunner') 

  bufnr = api.nvim_win_get_buf(0) -- get the buffer handler

  api.nvim_buf_set_lines(bufnr, 0, -1, false, {string.format("exec: ")})
  api.nvim_buf_set_lines(bufnr, 0, -1, false, cmd)
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function (_, data)
      if data then 
        api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
      end
    end,
    on_stderr = function (_, data)
      if data then 
        api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
      end
    end,
  })
end

return F
