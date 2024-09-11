/datum/rpg_skill
	var/name = ""
	var/desc = ""

	// Additional points allocated on top of the parent type stat's own.
	var/value = 0
	var/list/modifiers

	/// All skills must have a valid parent stat type.
	var/parent_stat_type = null

/datum/rpg_skill/proc/get(mob/living/user)
	return value

/// Update the modified value with modifiers.
/datum/rpg_skill/proc/update_modifiers()
	SHOULD_NOT_OVERRIDE(TRUE)
	value = 0
	for(var/source in modifiers)
		value += modifiers[source]
