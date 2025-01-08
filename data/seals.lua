SMODS.Atlas({
    key = "emp_seals",
    path = "emp_seals.png",
    px = 71,
    py = 95
})

SMODS.Seal {
    name = "Emerald Seal",
    key = "emerald",
    badge_colour = HEX("0b6623"),
	config = { plus_discard = 1 },
    discovered = true,
    loc_vars = function(self, info_queue)
        return { vars = {
            self.config.plus_discard,
        } }
    end,
    atlas = "emp_seals",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + self.config.plus_discard
            ease_discard(self.config.plus_discard)
            delay(.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0,
                func = function() 
                    if card.ability.effect == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve()
                    end
                    return true 
                end 
            }))
            delay(.3)
        end
    end
}

SMODS.Seal {
    name = "Amber Seal",
    key = "amber",
    badge_colour = HEX("ffaa21"),
	config = { plus_hand = 1 },
    discovered = true,
    loc_vars = function(self, info_queue)
        return { vars = {
            self.config.plus_hand,
        } }
    end,
    atlas = "emp_seals",
    pos = { x = 1, y = 0 },
    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + self.config.plus_hand
            ease_hands_played(self.config.plus_hand)
            delay(.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0,
                func = function() 
                    if card.ability.effect == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve()
                    end
                    return true 
                end 
            }))
            delay(.3)
        end
    end
}

SMODS.Seal {
    name = "Silver Seal",
    key = "silver",
    badge_colour = HEX("7692a4"),
	config = { plus_played_hand = 3 },
    discovered = true,
    loc_vars = function(self, info_queue)
        return { vars = {
            self.config.plus_played_hand,
        } }
    end,
    atlas = "emp_seals",
    pos = { x = 2, y = 0 },
    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 then
            local _hand, _tally = nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if _tally == 0 then
                _hand = G.handlist[12]
            end
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
            level_up_hand(card, _hand, nil, 3)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            delay(.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0,
                func = function() 
                    if card.ability.effect == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve()
                    end
                    return true 
                end 
            }))
            delay(.3)
        end
    end
}

SMODS.Seal {
    name = "Teal Seal",
    key = "teal",
    badge_colour = HEX("21d9ff"),
	config = { plus_size = 1 },
    discovered = true,
    loc_vars = function(self, info_queue)
        return { vars = {
            self.config.plus_size,
        } }
    end,
    atlas = "emp_seals",
    pos = { x = 3, y = 0 },
    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 then
            G.hand:change_size(self.config.plus_size)
            delay(.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0,
                func = function() 
                    if card.ability.effect == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve()
                    end
                    return true 
                end 
            }))
            delay(.3)
        end
    end
}

SMODS.Seal {
    name = "Bronze Seal",
    key = "bronze",
    badge_colour = HEX("c78258"),
	config = { plus_dollars = 10 },
    discovered = true,
    loc_vars = function(self, info_queue)
        return { vars = {
            self.config.plus_dollars,
        } }
    end,
    atlas = "emp_seals",
    pos = { x = 4, y = 0 },
    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 then
            ease_dollars(self.config.plus_dollars)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0,
                func = function() 
                    if card.ability.effect == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve()
                    end
                    return true 
                end 
            }))
            delay(.3)
        end
    end
}

return