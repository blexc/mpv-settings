-- Pause video when lost focus
-- Resume video only if was previously paused by this script
-- TODO pause when mouse away from window

local was_paused = false

mp.observe_property("focused", "bool", function(name, value)
    if value then
        if was_paused then
            mp.set_property("pause", "no")
        end
    else
        if mp.get_property_native("pause") == false then
            was_paused = true
            mp.set_property("pause", "yes")
        else
            was_paused = false
        end
    end
end)
