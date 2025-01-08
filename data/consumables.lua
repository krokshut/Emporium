SMODS.Atlas({
    key = "emp_consumables",
    path = "emp_consumables.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "emp_boosters",
    path = "emp_boosters.png",
    px = 71,
    py = 95
})

SMODS.ConsumableType({
    key = "Wax",
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.RED,
    collection_rows = {3, 2},
    loc_txt = {},
    shop_rate = 0.0,
    default = 'emp_shedding'
})

-- cards

SMODS.Consumable({
    key = 'shedding',
    set = 'Wax',
    collection = "Wax Cards",
    atlas = 'emp_consumables',
    pos = {x=0, y=0},
    discovered = false,
    config = {
        mod_conv = "emp_emerald_seal",
        seal = { 
            plus_discard = 1, 
        },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "emp_emerald_seal",
            specific_vars = {
                self.config.seal.plus_discard,
            }
        }
        return { vars = {center.ability.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do 
            local highlighted = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if highlighted then
                        highlighted:set_seal('emp_emerald', nil, true)
                    end
                    return true
                end
            }))
            delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
        end
    end
})

SMODS.Consumable({
    key = 'grasping',
    set = 'Wax',
    collection = "Wax Cards",
    atlas = 'emp_consumables',
    pos = {x=0, y=0},
    discovered = false,
    config = {
        mod_conv = "emp_amber_seal",
        seal = { 
            plus_hand = 1, 
        },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "emp_amber_seal",
            specific_vars = {
                self.config.seal.plus_hand,
            }
        }
        return { vars = {center.ability.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do 
            local highlighted = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if highlighted then
                        highlighted:set_seal('emp_amber', nil, true)
                    end
                    return true
                end
            }))
            delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
        end
    end
})

SMODS.Consumable({
    key = 'mastery',
    set = 'Wax',
    collection = "Wax Cards",
    atlas = 'emp_consumables',
    pos = {x=0, y=0},
    discovered = false,
    config = {
        mod_conv = "emp_silver_seal",
        seal = { 
            plus_played_hand = 3, 
        },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "emp_silver_seal",
            specific_vars = {
                self.config.seal.plus_played_hand,
            }
        }
        return { vars = {center.ability.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do 
            local highlighted = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if highlighted then
                        highlighted:set_seal('emp_silver', nil, true)
                    end
                    return true
                end
            }))
            delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
        end
    end
})

SMODS.Consumable({
    key = 'expansion',
    set = 'Wax',
    collection = "Wax Cards",
    atlas = 'emp_consumables',
    pos = {x=0, y=0},
    discovered = false,
    config = {
        mod_conv = "emp_teal_seal",
        seal = { 
            plus_hand_size = 1, 
        },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "emp_teal_seal",
            specific_vars = {
                self.config.seal.plus_hand_size,
            }
        }
        return { vars = {center.ability.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do 
            local highlighted = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if highlighted then
                        highlighted:set_seal('emp_teal', nil, true)
                    end
                    return true
                end
            }))
            delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
        end
    end
})

SMODS.Consumable({
    key = 'prosperity',
    set = 'Wax',
    collection = "Wax Cards",
    atlas = 'emp_consumables',
    pos = {x=0, y=0},
    discovered = false,
    config = {
        mod_conv = "emp_bronze_seal",
        seal = { 
            plus_dollars = 10, 
        },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "emp_bronze_seal",
            specific_vars = {
                self.config.seal.plus_dollars,
            }
        }
        return { vars = {center.ability.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do 
            local highlighted = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if highlighted then
                        highlighted:set_seal('emp_bronze', nil, true)
                    end
                    return true
                end
            }))
            delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
        end
    end
})

-- packs

SMODS.Booster{
    key = 'wax_normal_1',
    kind = 'Wax',
    atlas = 'emp_boosters',
    pos = { x = 0, y = 0 },
    discovered = false,
    config = { extra = 2, choose = 1 },
    weight = .3, -- .3, .3, .07
    cost = 6, -- 9, 12, 15
    group_key = 'k_emp_wax_pack',
    draw_hand = true,
    create_card = function(self, card)
		return SMODS.create_card({
            set = "Wax", 
            area = G.pack_cards, 
            legendary = nil, 
            rarity = nil, 
            skip_materialize = true, 
            soulable = nil, 
            key = nil, 
            key_append = "emp_wax",
        })
	end,
	ease_background_colour = function(self)
		ease_background_colour_blind(G.STATES.TAROT_PACK)
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
}

SMODS.Booster{
    key = 'wax_normal_2',
    kind = 'Wax',
    atlas = 'emp_boosters',
    pos = { x = 0, y = 0 },
    discovered = false,
    config = { extra = 3, choose = 1 },
    weight = .25, -- .3, .3, .07
    cost = 9, -- 9, 12, 15
    group_key = 'k_emp_wax_pack',
    draw_hand = true,
    create_card = function(self, card)
		return SMODS.create_card({
            set = "Wax", 
            area = G.pack_cards, 
            legendary = nil, 
            rarity = nil, 
            skip_materialize = true, 
            soulable = nil, 
            key = nil, 
            key_append = "emp_wax",
        })
	end,
	ease_background_colour = function(self)
		ease_background_colour_blind(G.STATES.TAROT_PACK)
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
}

SMODS.Booster{
    key = 'wax_jumbo_1',
    kind = 'Wax',
    atlas = 'emp_boosters',
    pos = { x = 0, y = 0 },
    discovered = false,
    config = { extra = 5, choose = 1 },
    weight = .18, -- .3, .3, .07
    cost = 12, -- 9, 12, 15
    group_key = 'k_emp_wax_pack',
    draw_hand = true,
    create_card = function(self, card)
		return SMODS.create_card({
            set = "Wax", 
            area = G.pack_cards, 
            legendary = nil, 
            rarity = nil, 
            skip_materialize = true, 
            soulable = nil, 
            key = nil, 
            key_append = "emp_wax",
        })
	end,
	ease_background_colour = function(self)
		ease_background_colour_blind(G.STATES.TAROT_PACK)
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
}

SMODS.Booster{
    key = 'wax_mega_1',
    kind = 'Wax',
    atlas = 'emp_boosters',
    pos = { x = 0, y = 0 },
    discovered = false,
    config = { extra = 5, choose = 2 },
    weight = .1, -- .3, .3, .07
    cost = 15, -- 9, 12, 15
    group_key = 'k_emp_wax_pack',
    draw_hand = true,
    create_card = function(self, card)
		return SMODS.create_card({
            set = "Wax", 
            area = G.pack_cards, 
            legendary = nil, 
            rarity = nil, 
            skip_materialize = true, 
            soulable = nil, 
            key = nil, 
            key_append = "emp_wax",
        })
	end,
	ease_background_colour = function(self)
		ease_background_colour_blind(G.STATES.TAROT_PACK)
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
}

return