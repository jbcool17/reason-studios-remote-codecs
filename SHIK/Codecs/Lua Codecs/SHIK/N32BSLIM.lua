-- Reason ReMote Codec for SHIK N32BSLIM
-- Version 1.0.3

----------------------------------------------- Global Properties -------------------------------------------------
function remote_init(manufacturer, model)
    local items = {}
    for i = 1, 32 do
        table.insert(items, { name = "knob" .. i, input = "value", min = 0, max = 127 })
    end
    remote.define_items(items)

    local inputs = {}
    for i = 0, 31 do
        -- Format CC as two hex digits
        local cc_hex = string.format("%02x", i)
        table.insert(inputs, { pattern = "b? " .. cc_hex .. " xx", name = "knob" .. (i + 1) })
    end
    remote.define_auto_inputs(inputs)
end