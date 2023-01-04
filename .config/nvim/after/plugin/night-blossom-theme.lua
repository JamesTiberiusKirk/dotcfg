-- Colorscheme generated by https://github.com/arcticlimer/djanho
-- vim.cmd[[highlight clear]]


local NightBlossom = function()

  local highlight = function(group, bg, fg, attr)
    fg = fg and 'guifg=' .. fg or ''
    bg = bg and 'guibg=' .. bg or ''
    attr = attr and 'gui=' .. attr or ''

    vim.api.nvim_command('highlight ' .. group .. ' '.. fg .. ' ' .. bg .. ' '.. attr)
  end

  local link = function(target, group)
    vim.api.nvim_command('highlight! link ' .. target .. ' '.. group)
  end

  local Color6 = '#bfa6b6'
  local Color10 = '#45335b'
  local Color3 = '#6ADCEA'
  local Color5 = '#ff99ff'
  local Color14 = '#886196'
  local Color11 = '#152f47'
  local Color0 = '#eb73bf'
  local Color4 = '#A99CFF'
  local Color2 = '#ffb3ff'
  local Color8 = '#00041f'
  local Color7 = '#ffa14a'
  local Color12 = '#2e0d2e'
  local Color9 = '#ffebf7'
  local Color1 = '#ffbab8'
  local Color13 = '#4d495b'

  -- Background color
  -- local Color8 = '#000106'
  -- local Color9 = '#000000'

  highlight('Keyword', nil, Color0, nil)
  highlight('String', nil, Color1, nil)
  highlight('Type', nil, Color2, nil)
  highlight('Identifier', nil, Color3, nil)
  highlight('Function', nil, Color4, nil)
  highlight('Operator', nil, Color5, nil)
  highlight('Comment', nil, Color6, nil)
  highlight('Number', nil, Color7, nil)
  highlight('StatusLine', Color2, Color8, nil)
  highlight('WildMenu', Color8, Color9, nil)
  highlight('Pmenu', Color8, Color9, nil)
  highlight('PmenuSel', Color9, Color10, nil)
  highlight('PmenuThumb', Color8, Color9, nil)
  highlight('DiffAdd', Color11, nil, nil)
  highlight('DiffDelete', Color12, nil, nil)
  highlight('Normal', Color8, Color9, nil)
  highlight('Visual', Color13, nil, nil)
  highlight('CursorLine', Color13, nil, nil)
  highlight('ColorColumn', Color13, nil, nil)
  highlight('SignColumn', Color8, nil, nil)
  highlight('LineNr', nil, Color13, nil)
  highlight('TabLine', Color8, Color14, nil)
  highlight('TabLineSel', Color2, Color10, nil)
  highlight('TabLineFill', Color8, Color14, nil)
  highlight('TSPunctDelimiter', nil, Color9, nil)

  link('TSFunction', 'Function')
  link('CursorLineNr', 'Identifier')
  link('TSString', 'String')
  link('TSComment', 'Comment')
  link('Folded', 'Comment')
  link('TSType', 'Type')
  link('TSNumber', 'Number')
  link('TSPunctBracket', 'MyTag')
  link('TSParameterReference', 'TSParameter')
  link('TSParameter', 'Constant')
  link('TSNamespace', 'TSType')
  link('Whitespace', 'Comment')
  link('Repeat', 'Conditional')
  link('TSPunctSpecial', 'TSPunctDelimiter')
  link('TSFuncMacro', 'Macro')
  link('TSRepeat', 'Repeat')
  link('TSKeyword', 'Keyword')
  link('TSField', 'Constant')
  link('TelescopeNormal', 'Normal')
  link('TSTagDelimiter', 'Type')
  link('Macro', 'Function')
  link('TSTag', 'MyTag')
  link('Conditional', 'Operator')
  link('Operator', 'Keyword')
  link('TSProperty', 'TSField')
  link('NonText', 'Comment')
  link('TSOperator', 'Operator')
  link('TSFloat', 'Number')
  link('TSLabel', 'Type')
  link('TSConditional', 'Conditional')
  link('TSConstant', 'Constant')
  link('TSConstBuiltin', 'TSVariableBuiltin')

end

-- NightBlossom()
