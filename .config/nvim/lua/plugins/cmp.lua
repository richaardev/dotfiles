return {
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local function get_color(group, attr)
				local fn = vim.fn
				return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
			end

			local color = get_color("BufferCurrent", "bg#")
			vim.api.nvim_set_hl(0, "CmpItemColor", { bg = color })

			opts.window = {
				completion = require("cmp").config.window.bordered({
					winhighlight = "Normal:CmpItemColor,FloatBorder:CmpItemColor,CursorLine:Visual,Search:None",
				}),
			}
		end,
	},
}
