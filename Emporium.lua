local current_mod = SMODS.current_mod
local mod_path = SMODS.current_mod.path

SMODS.Atlas({
    key = "modicon",
    path = "emp_icon.png",
    px = 34,
    py = 34
})

-- custom colors
local emp_colours = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        emp_colours()
    end
    G.ARGS.LOC_COLOURS["emerald"] = HEX('319b54')
    G.ARGS.LOC_COLOURS["amber"] = HEX('ffaa21')
    G.ARGS.LOC_COLOURS["silver"] = HEX('7692a4')
    G.ARGS.LOC_COLOURS["teal"] = HEX('21d9ff')
    G.ARGS.LOC_COLOURS["bronze"] = HEX('c78258')
    G.ARGS.LOC_COLOURS["art"] = HEX('176d7f')
    G.ARGS.LOC_COLOURS["alt"] = HEX('7f1739')
    return emp_colours(_c, _default)
end

-- load files
SMODS.load_file("localization/default.lua")()
SMODS.load_file("data/jokers.lua")()
SMODS.load_file("data/seals.lua")()
SMODS.load_file("data/consumables.lua")()
SMODS.load_file("data/tags.lua")()

if JokerDisplay then
    SMODS.load_file("data/joker_display_compat.lua")()
end