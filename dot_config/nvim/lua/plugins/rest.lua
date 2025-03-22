return {
  'rest-nvim/rest.nvim',
  config = function ()
    require('rest-nvim').setup({
      result_split_horizontal = true,
      skip_ssl_vertification = false,
      encode_url = true,
      highlight = { enabled = true },
      result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
      },
    })
  end
}
