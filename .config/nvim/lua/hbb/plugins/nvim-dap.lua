return {
	"mfussenegger/nvim-dap",
	dependencies = "rcarriga/nvim-dap-ui",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- setup dap
		dapui.setup()

		-- add event listeners
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
      vim.cmd("NvimTreeClose")
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			-- dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			-- dapui.close()
		end
	end,
  keys = {
    { "<leader>da", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate debug" },
    { '<leader>db', function() require('dap').list_breakpoints() end, desc = "List breakpoints" },
    { '<leader>dx', function() require('dap').clear_breakpoints() end, desc = "Clear breakpoints" },
    { '<leader>dr', function() require('dap').repl.open() end, desc = "Clear breakpoints" },
    { '<leader>dk', function() require('dap').down() end, desc = "Go prev stacktrack" },
    { '<leader>dj', function() require('dap').up() end, desc = "Go next stacktrack" },
    { '<leader>dd', function() require('dap').run_to_cursor() end, desc = "Run to cursor" },
    { '<leader>dl', function() require('dap').run_last() end, desc = "Run the last" },
    { '<F5>', function() require('dap').continue() end, desc = "Continue" },
    { '<F6>', function() require('dap').step_over() end, desc = "Step Over" },
    { '<F7>', function() require('dap').step_into() end, desc = "Step Into" },
    { '<F8>', function() require('dap').step_out() end, desc = "Step Out" },
  }
}
