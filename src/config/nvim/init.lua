-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/init.lua
-- By: @ExtinctAxolotl
-- thx, @shaunsingh

pcall(require, "impatient")
local modules = {
  "pack",
  "options",
  "mappings",
  "colors",
  "packer_compiled",
}

for i = 1, #modules, 1 do
  pcall(require, modules[i])
end
-- vim:foldmethod=marker
