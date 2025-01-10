SMODS.Atlas({
    key = "emp_jokers",
    path = "emp_jokers.png",
    px = 71,
    py = 95
})

-- Common Jokers

SMODS.Joker{
    key = "shadow",
    config = { type = "Two Pair", mult = 20 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 4, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.mult, localize(center.ability.type, "poker_hands") } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if context.scoring_name == card.ability.type then
                local check = true
                for k, v in pairs(context.scoring_hand) do
                    if not v:is_suit("Spades") and not v:is_suit("Clubs") then
                        check = false
                    end
                end
                if check then
                    return {
                        message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
                        mult_mod = card.ability.mult
                    }
                end
            end
        end        
    end
}

SMODS.Joker{
    key = "crimson",
    config = { type = "Two Pair", mult = 20 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 3, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.mult, localize(center.ability.type, "poker_hands") } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if context.scoring_name == card.ability.type then
                local check = true
                for k, v in pairs(context.scoring_hand) do
                    if not v:is_suit("Hearts") and not v:is_suit("Diamonds") then
                        check = false
                    end
                end
                if check then
                    return {
                        message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
                        mult_mod = card.ability.mult
                    }
                end
            end
        end        
    end
}

SMODS.Joker{
    key = "scattered",
    config = { mult = 5 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 1, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return { vars = { center.ability.mult } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local diamond, heart, spade, club = false, false, false, false
            local count = 0
            for k, v in pairs(context.scoring_hand) do
                if v.ability.name == "Wild Card" then
                    count = count + 1
                else 
                    if v:is_suit("Hearts") and not heart then
                        heart = true
                        count = count + 1
                    end
                    if v:is_suit("Diamonds") and not diamond then
                        diamond = true
                        count = count + 1
                    end
                    if v:is_suit("Spades") and not spade then
                        spade = true
                        count = count + 1
                    end
                    if v:is_suit("Clubs") and not club then
                        club = true
                        count = count + 1
                    end
                end
            end
            return {
                message = localize{type='variable',key='a_mult',vars={count*card.ability.mult}},
                mult_mod = count*card.ability.mult
            }
        end 
    end
}

SMODS.Joker{
    key = "spite",
    config = { extra = {xmult = 1.2} },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.individual and not context.end_of_round and not context.after and not context.before then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED,
                    card = card,
                }
            else
                return {
                    x_mult = card.ability.extra.xmult,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = "nomad",
    config = { mult = 5 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.mult } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local count = 0
            for k, v in pairs(G.GAME.hands) do
                if v.played > 0 then
                    count = count + 1
                end
            end
            return {
                message = localize{type='variable',key='a_mult',vars={count*card.ability.mult}},
                mult_mod = count*card.ability.mult
            }
        end        
    end
}

SMODS.Joker{
    key = "unqualified",
    config = { xmult = 1.5, cards = 4 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 3, y = 1},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.xmult, center.ability.cards } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if #context.scoring_hand >= card.ability.cards then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.xmult}},
                    Xmult_mod = card.ability.xmult
                }
            end
        end        
    end
}

SMODS.Joker{
    key = "spirited",
    config = { mult = 0, extra = 10 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra, center.ability.mult } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == "Spectral" and not context.blueprint then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_mult',vars={card.ability.extra}}})
                card.ability.mult = card.ability.mult + card.ability.extra
            end
        end
        if context.cardarea == G.jokers and context.joker_main and card.ability.mult > 0 then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
                mult_mod = card.ability.mult
            }
        end
    end
}

SMODS.Joker{
    key = "printing_press",
    config = { extra = {tags = 1}, mod_conv = "tag_emp_emboss", },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = false,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 5, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = "Tag",
            key = "tag_emp_emboss",
        }
        return { vars = { localize{type = 'name_text', set = 'Tag', key = 'tag_emp_emboss', nodes = {}} } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    for i = 1, card.ability.extra.tags do
                        add_tag(Tag('tag_emp_emboss'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    end
                    return true
                end)
            }))
        end
    end
}

SMODS.Joker{
    key = "peapod",
    config = { type = "Three of a Kind", extra = {tags = 3} },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = false,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 2, y = 1},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'tag_double', set = 'Tag'}
        return { vars = { localize(center.ability.type, "poker_hands"), center.ability.extra.tags, localize{type = 'name_text', set = 'Tag', key = 'tag_double', nodes = {}} } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after and not context.blueprint then
            if context.scoring_name == card.ability.type then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i = 1, card.ability.extra.tags do
                            add_tag(Tag('tag_double'))
                        end
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        play_sound("tarot1")
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true
                            end,
                        }))
                        return true
                    end
                }))
                return {
                    message = localize("k_extinct_ex"),
                    colour = G.C.FILTER,
                }
            end
        end
    end
}

SMODS.Joker{
    key = "opulent",
    config = { extra = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    cost = 4,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra } }
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.current_round.hands_left > 0 then 
            local bonus = card.ability.extra*G.GAME.current_round.hands_left
            return bonus 
        end
    end
}

-- Uncommon Jokers

SMODS.Joker{
    key = "triad",
    config = { xmult = 1.5, multiple = 3 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.xmult, center.ability.multiple } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() % card.ability.multiple == 0  then
                return {
                    x_mult = card.ability.xmult,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = "wishing_star",
    config = { extra = {mult = 5, money = 1}, mult = 0, money = 0},
    enhancement_gate = 'm_lucky',
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 2, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = { center.ability.extra.mult, center.ability.extra.money, center.ability.mult, center.ability.money } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.ability.name == "Lucky Card" then
                card.ability.mult = card.ability.mult + card.ability.extra.mult
                card.ability.money = card.ability.money + card.ability.extra.money
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
            end
        end
        if context.joker_main and card.ability.mult > 0 then
            return {
                message = localize{ type='variable', key='a_mult', vars={card.ability.mult} },
                mult_mod = card.ability.extra.mult,
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.money
        if bonus > 0 then 
            return bonus 
        end
    end
}

SMODS.Joker{
    key = "pawn_shop",
    config = { extra = {money = 1, xmult = 1.5} },
    enhancement_gate = 'm_steel',
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return { vars = { center.ability.extra.money, center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.name == "Steel Card" then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    x_mult = card.ability.extra.xmult,
                    dollars = 1,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = "moai",
    config = { extra = {chips = 100} },
    enhancement_gate = 'm_stone',
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return { vars = { center.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.name == "Stone Card" then
                return {
                    chips = card.ability.extra.chips,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = "extra_wild",
    config = { extra = {xchips = 1.5} },
    enhancement_gate = 'm_wild',
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return { vars = { center.ability.extra.xchips} }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if context.other_card.ability.name == "Wild Card" then
                return {
                    x_chips = card.ability.extra.xchips,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = "wild_bear",
    config = { extra = {xmult = 1.5} },
    enhancement_gate = 'm_wild',
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return { vars = { center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and not context.end_of_round and context.cardarea == G.hand and not context.before and not context.after then
            if context.other_card.ability.name == "Wild Card" then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                else 
                    return {
                        x_mult = card.ability.extra.xmult,
                        card = card
                    }
                end
            end
        end
    end
}

SMODS.Joker{
    key = "scales",
    config = { extra = {xmult = 2} },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 7,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.hands_left == G.GAME.current_round.discards_left then
                return {
                    message = localize{ type='variable', key='a_xmult', vars={card.ability.extra.xmult} },
                    Xmult_mod = card.ability.extra.xmult
                }
            end
        end
    end
}

-- Rare Jokers

SMODS.Joker{
    key = "clawmark",
    config = { extra = .5, xmult = .75 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    eternal_compat = true,
    cost = 8,
    atlas = "emp_jokers",
    pos = {x = 1, y = 1},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra, center.ability.xmult } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not card.getting_sliced then
            if #context.removed > 0 then
                if not context.blueprint then
                    card.ability.xmult = card.ability.xmult + #context.removed*card.ability.extra
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.xmult}}})
                end
            end
        end
        if context.joker_main then
            return {
                message = localize{ type='variable', key='a_xmult', vars={card.ability.xmult} },
                Xmult_mod = card.ability.xmult
            }
        end
    end
}

SMODS.Joker{
    key = "bleu_rare",
    config = { extra = {xmult = 2} },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 8,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.other_joker then
            if context.other_joker.config.center.rarity == 3 and card ~= context.other_joker then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                    Xmult_mod = card.ability.extra.xmult,
                    card = context.other_joker
                }
            end
        end
    end
}

SMODS.Joker{
    key = "fire_blanket",
    config = { extra = {mod = .5, odds = 5} },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    cost = 8,
    atlas = "emp_jokers",
    pos = {x = 0, y = 1},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.mod, G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if pseudorandom('fire_blanket') < G.GAME.probabilities.normal / card.ability.extra.odds and G.jokers.cards[1] then
                local jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card and not G.jokers.cards[i].debuff and not G.jokers.cards[i].ability.perishable then
                        jokers[#jokers+1] = G.jokers.cards[i]
                    end
                end
                if #jokers ~= 0 then
                    local joker_to_debuff = pseudorandom_element(jokers, pseudoseed('fire_blanket')) or nil
                    if joker_to_debuff then
                        SMODS.debuff_card(joker_to_debuff, true, "fire_blanket")
                        card_eval_status_text(joker_to_debuff, 'extra', nil, nil, nil, {message = localize('k_debuffed'), colour = G.C.RED })
                    end
                end
            end
            G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.mod
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.HUD_blind:recalculate(true)
            return {
                play_sound('chips2'),
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_halved'), colour = G.C.YELLOW})
            }
        end
        if context.end_of_round and not context.repetition and not context.individual then 
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].debuff and not G.jokers.cards[i].ability.perishable then
                    SMODS.debuff_card(G.jokers.cards[i], false, "fire_blanket")
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_rm_debuff'), colour = G.C.GREEN })
                    break
                end
            end
        end
    end
}

SMODS.Joker{
    key = "seal_of_authenticity",
    config = { extra = { repetitions = 2 } },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 8,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'}
        return { vars = { center.ability.extra.repetitions } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if context.other_card.seal then
                if context.other_card.seal == 'Red' then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.repetitions,
                        card = context.other_card
                    }
                end
            end
        end
    end
}

SMODS.Joker{
    key = "fourteen",
    config = { extra = { xmult = 5 }, check = 14 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 8,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.check, center.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local id = 0
            for k, v in pairs(context.scoring_hand) do
                id = id + v:get_id()
            end
            if id == 14 then
                return {
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra.xmult}},
                    Xmult_mod = card.ability.extra.xmult
                }
            end

        end
    end
}

-- Legendary Jokers

SMODS.Joker{
    key = "great_white",
    config = { extra = {chips = 0, mult = 0, xmult = 1, money = 0}, card_to_del = nil },
    rarity = 4,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 20,
    atlas = "emp_jokers",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.xmult, center.ability.extra.money} }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then 
            if not context.blueprint then
                local eval = function() return G.GAME.current_round.hands_played == 0 end
                juice_card_until(card, eval, true)
            end
        end
        if context.cardarea == G.jokers and context.before then
            if G.GAME.current_round.hands_played == 0 and not context.blueprint then
                if #context.full_hand == 1 then

                    local _card = context.full_hand[1]

                    card.ability.card_to_del = _card

                    local add_chips = 0
                    local add_mult = 0
                    local add_xmult = 0
                    local add_money = 0

                    -- base + hiker
                    add_chips = add_chips + _card.base.nominal
                    add_chips = add_chips + _card.ability.perma_bonus

                    -- bonus + mult
                    add_chips = add_chips + _card.ability.bonus
                    add_mult = add_mult + _card.ability.mult 

                    -- editions
                    if _card.edition then
                        if _card.edition.type == 'foil' then
                            add_chips = add_chips + 50
                        end
                        if _card.edition.type == 'holo' then
                            add_mult = add_mult + 10
                        end
                        if _card.edition.type == 'polychrome' then
                            add_xmult = add_xmult + .5
                        end
                    end

                    -- enhancements

                    if _card.ability.name == 'Glass Card' then
                        add_xmult = add_xmult + 1
                    end

                    if _card.ability.name == 'Steel Card' then
                        add_xmult = add_xmult + .5
                    end

                    if _card.ability.name == 'Stone Card' then
                        add_chips = add_chips - _card.base.nominal
                    end

                    if _card.ability.name == 'Gold Card' then
                        add_money = add_money + 3
                    end

                    if _card.ability.name == 'Lucky Card' then
                        add_money = add_money + 5
                        add_mult = add_mult + 10
                    end

                    -- final calcs 
                    card.ability.extra.chips = card.ability.extra.chips + add_chips
                    card.ability.extra.mult = card.ability.extra.mult + add_mult
                    card.ability.extra.xmult = card.ability.extra.xmult + add_xmult
                    card.ability.extra.money = card.ability.extra.money + add_money

                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                    
                end
            end
        end
        if context.joker_main and (card.ability.extra.chips > 0 or card.ability.extra.mult > 0 or card.ability.extra.xmult > 0) then
            return {
                chip_mod = card.ability.extra.chips,
                mult_mod = card.ability.extra.mult,
                Xmult_mod = card.ability.extra.xmult,
                message = localize('k_applied'),
                G.C.GREEN
            }
        end
        if context.after and not context.blueprint then
            if card.ability.card_to_del ~= nil then
                local card_to_del = card.ability.card_to_del
                card.ability.card_to_del = nil
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = .2,
                    func = function() 
                        if card_to_del.ability.effect == 'Glass Card' then 
                            card_to_del:shatter()
                        else
                            card_to_del:start_dissolve()
                        end
                        return true 
                    end 
                }))
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        if bonus > 0 then 
            return bonus 
        end
    end
}

return