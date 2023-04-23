-- ~/.config/nvim/init.lua

local pack_path = vim.fn.stdpath('data') .. '/site/pack'

function ensure (user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local fmt = string.format
  local install_path = fmt('%s/packer/start/%s', pack_path, repo, repo)
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print(fmt('Cloning missing bootstrap plugin: %s', repo))
    vim.fn.system({'git', 'clone', '--depth=1',
                    fmt('https://github.com/%s/%s', user, repo), install_path})
    vim.cmd(fmt('packadd %s', repo))
  end
end

-- Faster boot
-- ensure('lewis6991', 'impatient.nvim')
-- require('impatient')
-- require'impatient'.enable_profile()

-- Packer is our plugin manager.
ensure('wbthomason', 'packer.nvim')

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
-- Aniseed looks for this when it's loaded then loads the rest of your
-- configuration if it's set.
ensure('Olical', 'aniseed')
vim.g['aniseed#env'] = {module = 'absinthe.init'}
