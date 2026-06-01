local vue_path = vim.fn.expand(
	'$MASON/packages' ..
	'/vue-language-server' ..
	'/node_modules/@vue/language-server'
)

local filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' }

local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}

return {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin
				}
			}
		}
	},
	filetypes = filetypes
}
