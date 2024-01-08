---@class ZenConfig
---@field left integer
---@field right integer
---@field top integer
---@field bottom integer

---@class Zen
---@field config ZenConfig
---@field cached ZenConfig |nil
---@field on boolean
local Zen = {
    on = false,
    config = {
        left   = 100,
        right  = 100,
        top    = 0,
        bottom = 0,
    },
    cached = nil
}

---@param config ZenConfig
---@return Zen
Zen.setup = function(config)
    Zen.config = config
    Zen.cached = nil
    return Zen
end

Zen.toggle = function(window)
    if Zen.cached == nil then
        local config = window:effective_config().window_padding
        Zen.cached = {
            left   = config.left,
            right  = config.right,
            top    = config.top,
            bottom = config.bottom,
        }
    end

    local window_config = window:get_config_overrides() or {}
    if Zen.on then
        window_config.window_padding = Zen.cached
    else
        window_config.window_padding = Zen.config
    end
    window:set_config_overrides(window_config)
    Zen.on = not Zen.on
end

return Zen
