-- ref: https://neovide.dev/configuration.html

if vim.g.neovide then
   vim.o.guifont = "Hack Nerd font:h10"      -- font
   vim.g.neovide_refresh_rate = 60           -- refresh rate
   vim.g.neovide_cursor_antialiasing = true  -- anti alias
   vim.g.neovide_transparency = 0.8          -- opacity
   vim.g.neovide_cursor_vfx_mode = "railgun" -- cursor animation
   vim.g.neovide_scroll_animation_length = 0.3  -- smooth scroll
   vim.g.neovide_remember_window_size = true
   vim.g.neovide_cursor_smooth_blink = true
end
