-- in ~/.config/nvim/lua/snippets/eruby.lua
local snip_setup_ok, luasnip = pcall(require, "luasnip")
if not snip_setup_ok then
  vim.notify("error loading 'luasnip' plugin")
  return
end

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  s("if", {
    t("<% if "), i(1, "cond"), t(" %>"),
    t({ "", "  " }), i(2, "content"),
    t({ "", "<% end %>" }),
  }),
  s("ifelse", {
    t("<% if "), i(1, "cond"), t(" %>"),
    t({ "", "<% else %>" }),
    t({ "", "<% end %>" }),
  }),
  -- Add more ERB snippets here (e.g., <% %> for execution, <%= %> for output)
  s("eq", {
    t("<%= "), i(0), t(" %>"),
  }),
  s("exec", {
    t("<% "), i(0), t(" %>"),
  }),
}
