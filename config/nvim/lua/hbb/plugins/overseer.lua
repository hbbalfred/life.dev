return {
	"stevearc/overseer.nvim",
	opts = {
		templates = { "npm", "vscode" },
		task_list = {
			bindings = {
				["<CR>"] = "TogglePreview",
				["<C-f>"] = "ScrollOutputDown",
				["<C-b>"] = "ScrollOutputUp",
				["<C-h>"] = false,
				["<C-l>"] = false,
				["/"] = "RunAction",
				["i"] = "Edit",
				["x"] = "<CMD>OverseerQuickAction dispose<CR>",
				["j"] = "NextTask",
				["k"] = "PrevTask",
			},
		},
	},
	keys = {
		{ "<leader>ta", ":OverseerRun<CR>", { desc = "Open tasks to run" } },
		{ "<leader>tt", ":OverseerToggle<CR>", { desc = "Open tasks panel" } },
	},
}
