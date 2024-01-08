---@class EasyToShowConfig
---@field font_size integer

---@class EasyToShow
---@field config EasyToShowConfig
---@field cached EasyToShowConfig | nil
---@field on boolean
local EasyToShow = {
    on = false,
    config = { font_size = 15 },
    cached = nil
}

---@param config EasyToShowConfig
---@return EasyToShow
EasyToShow.setup = function(config)
    EasyToShow.config = config
    EasyToShow.cached = nil
    return EasyToShow
end

EasyToShow.toggle = function(window)
    if EasyToShow.cached == nil then
        local config = window:effective_config()
        EasyToShow.cached = { font_size = config.font_size }
    end

    local window_config = window:get_config_overrides() or {}
    if EasyToShow.on then
        window_config.font_size = EasyToShow.cached.font_size
    else
        window_config.font_size = EasyToShow.config.font_size
    end

    window:set_config_overrides(window_config)
    EasyToShow.on = not EasyToShow.on
end

return EasyToShow
