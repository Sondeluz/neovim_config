--nvim tree config
vim.g.nvim_tree_ignore = {'.git'}
vim.g.nvim_tree_indent_markers = 1
require'nvim-tree'.setup {
    disable_netrw = true, -- disables netrw completely
    hijack_netrw = true, -- hijack netrw window on startup
    open_on_setup = true, -- open the tree when running this setup function
    ignore_ft_on_setup = {'dashboard'}, -- will not open on setup if the filetype is in this list
    auto_close = true, -- closes neovim automatically when the tree is the last **WINDOW** in the view
    open_on_tab = false, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    hijack_cursor = true, --- hijack the cursor in the tree to put it at the start of the filename
    update_cwd = true, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
    
    -- show lsp diagnostics in the signcolumn
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable      = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd  = true,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {}
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {}
    },

    view = {width = 35, 
            side = 'left', 
            auto_resize = true,  -- if true the tree will resize itself after opening a file
            mappings = {custom_only = false, list = {}}}
} 
