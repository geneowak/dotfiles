return {
  "coder/claudecode.nvim",
  enabled = true,
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>c",  nil,                              desc = "AI/Claude Code" },
    { "<leader>cT", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>cF", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>cR", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>cM", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>cB", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>cS", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    {
      "<leader>cA",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>cDA", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>cDD", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
