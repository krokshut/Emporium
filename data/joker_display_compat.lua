local jd = JokerDisplay.Definitions


jd["j_emp_shadow"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    extra = {
        {
            { text = "("},
            { ref_table = "card.joker_display_values", ref_value = "suit1", colour = G.C.SUITS.Spades },
            { text = " and " },
            { ref_table = "card.joker_display_values", ref_value = "suit2", colour = G.C.SUITS.Clubs },
            { text = ")" }
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
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    extra = {
        {
            { text = "("},
            { ref_table = "card.joker_display_values", ref_value = "suit1", colour = G.C.SUITS.Hearts },
            { text = " and " },
            { ref_table = "card.joker_display_values", ref_value = "suit2", colour = G.C.SUITS.Diamonds },
            { text = ")" }
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

jd["j_emp_scattered"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.MULT },
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
    end
}

jd["j_emp_nomad"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.MULT },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hands", G.C.CHIPS },
        { text = " unique hands played)" },
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
    calc_function = function(card) 
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if #scoring_hand >= card.ability.cards then
            card.joker_display_values.xmult = card.ability.xmult
        else
            card.joker_display_values.xmult = 0
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



return