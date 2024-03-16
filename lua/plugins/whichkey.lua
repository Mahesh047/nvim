
-- which loads which-key after all the UI elements are loaded. Events can be
-- normal autocommands events (:help autocomd-events).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end


-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin
return { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VeryLazy", -- Sets the loading event to 'VeryLazy'
    config = function() -- This is the function that runs, AFTER loading
        require("which-key").setup()

        -- Document existing key chains
        require("which-key").register({
            ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
            ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
            ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
            ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
            ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        })
    end,
}