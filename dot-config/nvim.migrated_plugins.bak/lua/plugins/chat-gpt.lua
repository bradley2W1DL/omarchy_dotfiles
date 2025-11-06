return {
  "jackMort/ChatGPT.nvim",
  opts = {
    -- requires that $OPENAI_API_KEY env variable is exposed
    openai_params = {
      model = "gpt-5-mini",
      max_tokens = 750,
    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
