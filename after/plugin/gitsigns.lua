require('gitsigns').setup {
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>: <author_time:%a, %b %e> - <summary>',
}


require('gitsigns').change_base('main', true)
