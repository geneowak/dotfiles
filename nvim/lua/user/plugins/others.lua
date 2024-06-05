return {
    -- Games to practice vim movements
  'ThePrimeagen/vim-be-good',

  -- Commenting support.
  'tpope/vim-commentary',

  -- Add, change, and delete surrounding text.
  'tpope/vim-surround',

  -- Useful commands like :Rename and :SudoWrite.
  'tpope/vim-eunuch',

  -- Pairs of handy bracket mappings, like [b and ]b.
  'tpope/vim-unimpaired',

  -- Indent autodetection with editorconfig support.
  'tpope/vim-sleuth',

  -- Allow plugins to enable repeating of commands.
  'tpope/vim-repeat',

  -- Add more languages.
  -- 'sheerun/vim-polyglot',

  -- Navigate seamlessly between Vim windows and Tmux panes.
  'christoomey/vim-tmux-navigator',

  -- Jump to the last location when opening a file.
  'farmergreg/vim-lastplace',

  -- Enable * searching with visually selected text.
  'nelstrom/vim-visual-star-search',

  -- Automatically create parent dirs when saving.
  'jessarcher/vim-heritage',

  -- Text objects for HTML attributes.
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = {'kana/vim-textobj-user'},
  },

  -- Markdonw preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Git commands.
  { 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },

  -- Automatically fix indentation when pasting code.
  {
    'sickill/vim-pasta',
    enabled = false,
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  },

  -- Split arrays and methods onto multiple lines, or join them back up.
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  },

  -- Automatically add closing brackets, quotes, etc.
  { 'windwp/nvim-autopairs', config = true },
}
