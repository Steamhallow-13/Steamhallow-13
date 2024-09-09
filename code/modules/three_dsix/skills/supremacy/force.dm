/datum/rpg_skill/force
	name = "Force"
	desc = "The possession of raw power; and adrenaline, alone."

	parent_stat_type = /datum/rpg_stat/supremacy

/datum/rpg_skill/force/get(mob/living/user)
	. = ..()
	if(user.incapacitated())
		. -= 10 // dome'd
