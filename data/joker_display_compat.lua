local jd = JokerDisplay.Definitions


jd["j_emp_shadow"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    extra = {
        {
            { text = "("},
            { ref_table = "card.joker_display_values", ref_value = "suit1", colour = G.C.SUITS.Spades },
            { text = " and " },
            { ref_table = "card.joker_display_values", ref_value = "suit2", colour = G.C.SUITS.Clubs },
            { text = ")" }
        },
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        }
    },
    extra_config = {
        colour = G.C.UI.TEXT_INACTIVE,
        scale = 0.3
    },
    calc_function = function(card)
        local mult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            if text == card.ability.type then
                local check = true
                for k, v in pairs(scoring_hand) do
                    if not v:is_suit("Spades") and not v:is_suit("Clubs") then
                        check = false
                    end
                end
                if check then
                    mult = card.ability.mult
                end
            end
        end  
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
        card.joker_display_values.suit1 = "Spades"
        card.joker_display_values.suit2 = "Clubs"

    end
}

jd["j_emp_crimson"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    extra = {
        {
            { text = "("},
            { ref_table = "card.joker_display_values", ref_value = "suit1", colour = G.C.SUITS.Hearts },
            { text = " and " },
            { ref_table = "card.joker_display_values", ref_value = "suit2", colour = G.C.SUITS.Diamonds },
            { text = ")" }
        },
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        }
    },
    extra_config = {
        colour = G.C.UI.TEXT_INACTIVE,
        scale = 0.3
    },
    calc_function = function(card)
        local mult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            if text == card.ability.type then
                local check = true
                for k, v in pairs(scoring_hand) do
                    if not v:is_suit("Hearts") and not v:is_suit("Diamonds") then
                        check = false
                    end
                end
                if check then
                    mult = card.ability.mult
                end
            end
        end  
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
        card.joker_display_values.suit1 = "Hearts"
        card.joker_display_values.suit2 = "Diamonds"

    end
}

jd["j_emp_scattered"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.MULT },
    },
    reminder_text = {
        { text = "(" },
        { text = "Per " },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()

        local diamond, heart, spade, club = false, false, false, false
        local count = 0
        for k, v in pairs(scoring_hand) do
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
        card.joker_display_values.count = count*card.ability.mult
        card.joker_display_values.localized_text = localize("k_suit")
    end
}

jd["j_emp_nomad"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.MULT },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hands", colour = G.C.CHIPS },
        { text = " unique hands)" },
    },
    calc_function = function(card) 
        local count = 0
        for k, v in pairs(G.GAME.hands) do
            if v.played > 0 then
                count = count + 1
            end
        end
        card.joker_display_values.hands = count
        card.joker_display_values.count = count*card.ability.mult
    end
}

jd["j_emp_spirited"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
    },
}

jd["j_emp_ethical"] = {
    extra = {
        {
            { ref_table = "card.joker_display_values", ref_value = "odd_count", retrigger_type = "mult", colour = G.C.CHIPS },
            { text = "x" },
            { border_nodes = 
                {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmultbad" }
                }
            }
        },
        {
            { text = "Odds:", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        },
        {
            { ref_table = "card.joker_display_values", ref_value = "even_count", retrigger_type = "mult", colour = G.C.CHIPS },
            { text = "x" },
            { border_nodes = 
                {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmultgood" }
                }
            }
        },
        {
            { text = "Evens:", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        },

    },
    calc_function = function(card) 
        local even, odd = 0, 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() == 14 then
                    odd = odd + 1
                end
                if scoring_card:get_id() <= 10 and scoring_card:get_id() >= 0 then
                    if scoring_card:get_id() % 2 == 0 then
                        even = even + 1
                    else 
                        odd = odd + 1
                    end
                end
            end
        end
        card.joker_display_values.even_count = even
        card.joker_display_values.odd_count = odd
    end
}

jd["j_emp_crooked"] = {
    extra = {
        {
            { ref_table = "card.joker_display_values", ref_value = "even_count", retrigger_type = "mult", colour = G.C.CHIPS },
            { text = "x" },
            { border_nodes = 
                {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmultbad" }
                }
            }
        },
        {
            { text = "Evens:", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        },
        {
            { ref_table = "card.joker_display_values", ref_value = "odd_count", retrigger_type = "mult", colour = G.C.CHIPS },
            { text = "x" },
            { border_nodes = 
                {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmultgood" }
                }
            }
        },
        {
            { text = "Odds:", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        },
    },
    calc_function = function(card) 
        local even, odd = 0, 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() == 14 then
                    odd = odd + 1
                end
                if scoring_card:get_id() <= 10 and scoring_card:get_id() >= 0 then
                    if scoring_card:get_id() % 2 == 0 then
                        even = even + 1
                    else 
                        odd = odd + 1
                    end
                end
            end
        end
        card.joker_display_values.even_count = even
        card.joker_display_values.odd_count = odd
    end
}

jd["j_emp_unqualified"] = {
    text = {
        {border_nodes = 
            {
                { text = "X" },
                { ref_table = "card.joker_display_values" , ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { text = "4 or more", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card) 
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if #scoring_hand >= card.ability.cards then
            card.joker_display_values.xmult = card.ability.xmult
        else
            card.joker_display_values.xmult = 1
        end
    end
}

jd["j_emp_spite"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "triggers", colour = G.C.ORANGE },
        { text = " triggers)" },
    },
    calc_function = function(card) 
        local playing_hand = next(G.play.cards)
        local count = 0
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if not playing_card.debuff then
                    count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                end
            end
        end
        card.joker_display_values.triggers = count
        card.joker_display_values.xmult = card.ability.extra.xmult ^ count
    end
}

jd["j_emp_gold_digger"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "mult" }
            }
        }
    },
}

jd["j_emp_medusa"] = {} -- none

jd["j_emp_opulent"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.CHIPS },
        { text = "x" },
        { text = "$", colour = G.C.GOLD },
        { ref_table = "card.ability", ref_value = "extra", colour = G.C.GOLD, retrigger_type = "mult" },
    },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        card.joker_display_values.count = G.GAME.current_round.hands_left
    end
}

jd["j_emp_printing_press"] = {
    text = {
        { text = "Sell", colour = G.C.UI.TEXT_INACTIVE },
    },
}

jd["j_emp_peapod"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" }
    },
    reminder_text = {
        {text = "(" },
        { text = "Three of a Kind", colour = G.C.ORANGE },
        {text = ")" },
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local hand = text == "Three of a Kind"
        card.joker_display_values.count = hand and "Active" or "Inactive"
        card.joker_display_values.active = hand
    end,
    style_function = function(card, text, reminder_text, extra)
        if text and text.children[1] then
            text.children[1].config.colour = card.joker_display_values.active and G.C.SECONDARY_SET.Spectral or G.C.UI.TEXT_INACTIVE
        end
        return false
    end
}

jd["j_emp_moai"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        { text = "+", colour = G.C.CHIPS },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
    },
    reminder_text = {
        { text = "(" },
        { text = "Stone Cards", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local count = 0
        for _, scoring_card in pairs(scoring_hand) do
            if scoring_card.ability.name == "Stone Card" then
                count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.count = count
    end
}

jd["j_emp_wishing_star"] = {
    text = {
        { text = "+", colour = G.C.MULT },
        { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
        { text = ", ", },
        { text = "$", colour = G.C.GOLD },
        { ref_table = "card.ability", ref_value = "money", retrigger_type = "mult", colour = G.C.GOLD },
    },
    reminder_text = {
        { text = "(Money per " },
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = localize("k_round")
    end
}

jd["j_emp_triad"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability", ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "(Multiples of "},
        { ref_table = "card.ability", ref_value = "multiple", colour = G.C.ORANGE },
        { text = ")" }
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local count = 0
        for _, scoring_card in pairs(scoring_hand) do
            if scoring_card:get_id() % card.ability.multiple == 0 then
                count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.count = count
    end
}

jd["j_emp_pawn_shop"] = {
    extra = {
        {
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
            { text = "x", scale = 0.35 },
            { text = "$", colour = G.C.GOLD },
            { ref_table = "card.ability.extra", ref_value = "money", colour = G.C.GOLD },

        },
        {
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
            { text = "x", scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                }
            }, 
        }
    },
    reminder_text = {
        { text = "("},
        { text = "Steel Cards", colour = G.C.ORANGE },
        { text = ")" }
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local count = 0
        for _, scoring_card in pairs(scoring_hand) do
            if scoring_card.ability.name == "Steel Card" then
                count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.count = count
    end
}

jd["j_emp_extra_wild"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xchips" }
            },
            border_colour = G.C.CHIPS
        }
    },
    reminder_text = {
        { text = "("},
        { text = "Wild Cards", colour = G.C.ORANGE },
        { text = ")" }
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local count = 0
        for _, scoring_card in pairs(scoring_hand) do
            if scoring_card.ability.name == "Wild Card" then
                count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.count = count
    end
}

jd["j_emp_wild_bear"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "triggers", colour = G.C.ORANGE },
        { text = " triggers)" },
    },
    calc_function = function(card)
        local playing_hand = next(G.play.cards)
        local count = 0
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card.ability.name == "Wild Card" then
                    count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                end
            end
        end
        card.joker_display_values.xmult = card.ability.extra.xmult ^ count
        card.joker_display_values.triggers = count
    end
}

jd["j_emp_scales"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hands", colour = G.C.CHIPS },
        { text = ", "},
        { ref_table = "card.joker_display_values", ref_value = "discards", colour = G.C.MULT },
        { text = ")" },
    },
    calc_function = function(card)
        local hands = G.GAME.current_round.hands_left
        local discards = G.GAME.current_round.discards_left
        card.joker_display_values.hands = hands
        card.joker_display_values.discards = discards

        local equal = hands == discards
        card.joker_display_values.xmult = equal and card.ability.extra.xmult or 1

    end
}

jd["j_emp_undistinguishable"] = {
    extra = {
        {
            { text = "must be " },
            { text = "equal", colour = G.C.ORANGE },
            { text = ")" }
        },
        {
            { text = "(All " },
            { text = "held cards", colour = G.C.ORANGE },
        },
    },
    extra_config = {
        colour = G.C.UI.TEXT_INACTIVE,
        scale = 0.3
    },
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            }
        }
    },
    calc_function = function(card)
        local playing_hand = next(G.play.cards)
        local cardrank
        if G.hand.cards then
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if not (playing_card.facing == 'back') and not playing_card.debuff then
                        cardrank = playing_card:get_id()
                        break
                    end
                end
            end
        else
            cardrank = nil
        end
        local check = true
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() ~= cardrank then
                    check = false
                end
            end
        end
        card.joker_display_values.xmult = check and card.ability.xmult or 1
    end
}

jd["j_emp_philanthropist"] = {
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        },
        {
            { text = "The Hermit", colour = G.C.SECONDARY_SET.Tarot}
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.odds } }
    end
}

jd["j_emp_bleu_rare"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "("},
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.RED },
        { text = ")" }
    },
    calc_function = function(card)
        local count = 0
        if G.jokers then
            for _, joker_card in ipairs(G.jokers.cards) do
                if joker_card.config.center.rarity and joker_card.config.center.rarity == 3 and joker_card ~= card then
                    count = count + 1
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text = localize("k_rare")
    end,
}

jd["j_emp_clawmark"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            }
        }
    },
    calc_function = function(card)
        card.joker_display_values.xmult = card.ability.xmult
    end
}

jd["j_emp_fourteen"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "(Sum = "},
        { ref_table = "card.joker_display_values", ref_value = "count"},
        { text = ")" }
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local rank = 0
        for _, scoring_card in pairs(scoring_hand) do
            rank = rank + scoring_card:get_id()
        end
        local check = rank == 14
        card.joker_display_values.check = check
        card.joker_display_values.count = rank
        card.joker_display_values.xmult = check and card.ability.extra.xmult or 1
    end,
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[1] and reminder_text.children[2] and reminder_text.children[3] then
            reminder_text.children[2].config.colour = card.joker_display_values.check and G.C.BLUE or G.C.RED
        end
        return false
    end,
}

jd["j_emp_seal_of_authenticity"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        { ref_table = "card.ability.extra", ref_value = "repetitions", colour = G.C.RED },
    },
    reminder_text = {
        { text = "(Repetitions)"},
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local count = 0
        for _, scoring_card in pairs(scoring_hand) do
            if scoring_card.seal then
                if scoring_card.seal == "Red" then
                    count = count +1
                end
            end
        end
        card.joker_display_values.count = count
    end
}

jd["j_emp_fire_blanket"] = {
    extra = {
        {
            { text = "(", colour = G.C.UI.TEXT_INACTIVE },
            { text = "to disable joker", colour = G.C.UI.TEXT_INACTIVE },
            { text = ")", colour = G.C.UI.TEXT_INACTIVE },
        },
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        },
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "mod" }
            },
            border_colour = G.C.MONEY
        },
        { text = " Blind Size"}
    },
    calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end
}

jd["j_emp_modulo"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "("},
        { ref_table = "card.joker_display_values", ref_value = "hands", colour = G.C.CHIPS },
        { text = " hands left)"}
    },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local mult = card.ability.extra.xmult*(G.GAME.current_round.hands_left)
        card.joker_display_values.count = #scoring_hand
        card.joker_display_values.xmult = mult
        card.joker_display_values.hands = G.GAME.current_round.hands_left
    end
}

jd["j_emp_great_white"] = {
    extra = {
        {
            { text = "$", colour = G.C.GOLD },
            { ref_table = "card.ability.extra", ref_value = "money", colour = G.C.GOLD },
        },
        {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                }
            }
        },
        {
            { text = "+", colour = G.C.MULT },
            { ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT },
        },
        {
            { text = "+", colour = G.C.CHIPS },
            { ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS },
        },
    }
}

return