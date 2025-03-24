local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
    print("it depend on cmp")
    return
end

---@type string
local quicklisp_setup_path = vim.fn.expand('$HOME/quicklisp/setup.lisp')

---@type string
local preload_path = '.sbcl.lisp'


---@return string | nil
local extends_sbcl = function()
    local files = vim.fs.find(preload_path, { limit = math.huge, type = "file", })
    if #files > 0 then
        return files[1]
    end
    return nil
end


---@param lisp_file string
local load_line = function(lisp_file)
    return string.format([["--load", "%s"]], lisp_file)
end

---@param ... string
---@return string
local load_lines = function(...)
    local lines = {}
    for _, file in ipairs({ ... }) do
        table.insert(lines, load_line(file))
    end
    return table.concat(lines, ", ")
end

---@param cmd_name string
---@param with_load string | nil
---@return string
local exec_cmd = function(cmd_name, with_load)
    local fn_name = string.format("NvlimeBuildServerCommandFor_%s", cmd_name)
    local load_options = load_lines(quicklisp_setup_path, with_load)


    -- import_local_scripts.lisp
    -- register local asdf
    --
    --> (let ((my-project-path (merge-pathnames "project/blah/" (user-homedir-pathname))))
    -->   (pushnew my-project-path asdf:*central-registry* :test #'equal))

    return string.format([[
            function! %s(nvlime_loader, nvlime_eval)
                return [
                    \ "sbcl",
                    \ %s,
                    \ "--load", a:nvlime_loader,
                    \ "--eval", a:nvlime_eval
                    \ ]
            endfunction
            ]], fn_name, load_options)
end

local setup = function()
    cmp.setup.filetype(
        { 'lisp' },
        {
            sources = {
                { name = 'nvlime' }
            }
        }
    )

    vim.g.nvlime_config = {
        leader = "<Space>",
        cmp = {
            enabled = true
        },
        implementation = "custom"
    }

    vim.g.nvlime_mappings = {
        global = {
            normal = {
                keymaps_help = "<Leader>?",
            }
        },
        lisp = {
            normal = {
                connection = {
                    new = "<Leader>cc",
                    switch = "<Leader>cs",
                    rename = "<Leader>cR",
                    close = "<Leader>cd"
                },
                server = {
                    new = "<Leader>rr",
                    show = "<Leader>rv",
                    show_selected = "<Leader>rV",
                    stop = "<Leader>rs",
                    stop_selected = "<Leader>rS",
                    rename = "<Leader>rR",
                    restart = "<Leader>rt"
                },
                macro = {
                    expand = "<Leader>mm",
                    expand_once = "<Leader>mo",
                    expand_all = "<Leader>ma"
                },
                compile = {
                    expr = "<Leader>ce",
                    toplevel_expr = "<Leader>ct",
                    file = "<Leader>cf"
                },
                describe = {
                    operator = "<Leader>k",
                    atom = "<Leader>k",
                },
                repl = {
                    prompt = "<Leader>si",
                }
            }
        },
    }
    local fn = exec_cmd("custom", extends_sbcl())
    vim.api.nvim_exec(fn, false)
end

return {
    setup = setup
}
