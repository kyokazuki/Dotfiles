require('telescope').setup({
    extensions = {
	file_browser = {
	}
    },
})
require('telescope').load_extension 'file_browser'
