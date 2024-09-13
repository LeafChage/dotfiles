---@class TransparentConfig
---@field r string
---@field g string
---@field b string
---@field alpha string

---@class Transparent
---@field config TransparentConfig
---@field on boolean
local Transparent = {
    on = false,
    config = {
        r = '36',
        g = '40',
        b = '59',
        alpha = '60%'
    },
}

---@param config TransparentConfig
---@return Transparent
Transparent.setup = function(config)
    Transparent.config = config
    return Transparent
end


---@param isTransparent boolean
---@return string
Transparent.fmtColor = function(isTransparent)
    if isTransparent then
        return string.format("rgba(%s %s %s %s)", Transparent.config.r, Transparent.config.g, Transparent.config.b, Transparent.config.alpha)
    else
        return string.format("rgb(%s %s %s)", Transparent.config.r, Transparent.config.g, Transparent.config.b)
    end
end

Transparent.toggle = function(window)
    local window_config = window:get_config_overrides() or {}
    Transparent.on = not Transparent.on
    window_config.colors.background = Transparent.fmtColor(Transparent.on);
    window:set_config_overrides(window_config)
end

return Transparent
