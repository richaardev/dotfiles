return {
	"ThePrimeagen/harpoon",
	enabled = false,
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local harpoon = require("harpoon")

		local keymaps = {
			plugin = true,

			n = {
				{
					"<a-a>",
					function()
						harpoon:list():append()
					end,
				},
				{
					"<a-n>",
					function()
						local conf = require("telescope.config").values
						local function toggle_telescope(harpoon_files)
							local file_paths = {}
							for _, item in ipairs(harpoon_files.items) do
								table.insert(file_paths, item.value)
							end

							require("telescope.pickers")
								.new({}, {
									prompt_title = "Harpoon",
									finder = require("telescope.finders").new_table({
										results = file_paths,
									}),
									previewer = conf.file_previewer({}),
									sorter = conf.generic_sorter({}),
								})
								:find()
						end

						toggle_telescope(harpoon:list())
					end,
				},

				{
					"<a-1>",
					function()
						harpoon:list():select(1)
					end,
				},
				{
					"<a-2>",
					function()
						harpoon:list():select(2)
					end,
				},
				{
					"<a-3>",
					function()
						harpoon:list():select(3)
					end,
				},
				{
					"<a-4>",
					function()
						harpoon:list():select(4)
					end,
				},

				-- Toggle previous & next buffers stored within Harpoon list
				{
					"<a-h>",
					function()
						harpoon:list():prev()
					end,
				},
				{
					"<a-l>",
					function()
						harpoon:list():next()
					end,
				},
			},
		}

		require("utils").keymap.loadkeymaps(keymaps)
	end,
	opts = function()
		return {}
	end,
	config = function(_, opts)
		require("harpoon").setup()
	end,
}
