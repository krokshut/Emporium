SMODS.Atlas({
    key = "emp_tags",
    path = "emp_tags.png",
    px = 32,
    py = 32
})

SMODS.Tag {
	atlas = "emp_tags",
	name = "emp_Emboss Tag",
	pos = { x = 0, y = 0 },
	config = { type = "new_blind_choice" },
	key = "emboss",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { 
            set = "Other", 
            key = "p_emp_wax_normal_1", 
            specific_vars = { 1, 2 } 
        }
		return { vars = {} }
	end,
	apply = function(self, tag, context) -- adapted from cryptid, no clue what this does
		if context.type == "new_blind_choice" then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_emp_wax_normal_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
                G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

return