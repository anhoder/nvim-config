-- return {
--   "Dhanus3133/LeetBuddy.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope.nvim",
--   },
--   config = function()
--     require("leetbuddy").setup({
--       domain = "cn",
--       language = "go",
--     })
--   end,
--   keys = {
--     { "<leader>ll", "<cmd>LBQuestions<cr>", desc = "List Questions" },
--     { "<leader>lv", "<cmd>LBQuestion<cr>", desc = "View Question" },
--     { "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
--     { "<leader>lt", "<cmd>LBTest<cr>", desc = "Test Code" },
--     { "<leader>ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
--   },
-- }

return {
  "mbledkowski/neuleetcode.vim",
}
