local ok, comment = pcall(require, 'Comment')
if not ok then return end

comment.setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<C-z>',
        ---Block-comment toggle keymap
        block = nil,
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<C-z>',
        ---Block-comment keymap
        block = nil,
    },
    extra = nil,
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        extra = false,
    },
    pre_hook = nil,
    post_hook = nil,
})
