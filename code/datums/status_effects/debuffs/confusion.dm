/// The threshold in which all of our movements are fully randomized, in seconds.
#define CONFUSION_FULL_THRESHOLD 40
/// A multiplier applied on how much time is left (in seconds) that determines the chance of moving sideways randomly
#define CONFUSION_SIDEWAYS_MOVE_PROB_PER_SECOND 1.5
/// A multiplier applied on how much time is left (in seconds) that determines the chance of moving diagonally randomly
#define CONFUSION_DIAGONAL_MOVE_PROB_PER_SECOND 3

/// A status effect used for adding confusion to a mob.
/datum/status_effect/confusion
	id = "confusion"
	alert_type = null
	remove_on_fullheal = TRUE

/datum/status_effect/confusion/on_creation(mob/living/new_owner, duration = 10 SECONDS)
	src.duration = duration
	return ..()

/datum/status_effect/confusion/on_apply()
	RegisterSignal(owner, COMSIG_MOB_CLIENT_PRE_MOVE, PROC_REF(on_move))
	owner.stats?.set_skill_modifier(-1, /datum/rpg_skill/prowess, SKILL_SOURCE_CONFUSION)
	owner.stats?.set_stat_modifier(-1, /datum/rpg_stat/coherency, SKILL_SOURCE_CONFUSION)
	return TRUE

/datum/status_effect/confusion/on_remove()
	UnregisterSignal(owner, COMSIG_MOB_CLIENT_PRE_MOVE)
	owner.stats?.remove_skill_modifier(/datum/rpg_skill/prowess, SKILL_SOURCE_CONFUSION)
	owner.stats?.remove_stat_modifier(/datum/rpg_stat/coherency, SKILL_SOURCE_CONFUSION)

/// Signal proc for [COMSIG_MOB_CLIENT_PRE_MOVE]. We have a chance to mix up our movement pre-move with confusion.
/datum/status_effect/confusion/proc/on_move(datum/source, list/move_args)
	SIGNAL_HANDLER

	// How much time is left in the duration, in seconds.
	var/time_left = (duration - world.time) / 10
	var/direction = move_args[MOVE_ARG_DIRECTION]
	var/new_dir

	if(time_left > CONFUSION_FULL_THRESHOLD && !owner.resting)
		new_dir = pick(GLOB.alldirs)

	else if(prob(time_left * CONFUSION_SIDEWAYS_MOVE_PROB_PER_SECOND))
		new_dir = angle2dir(dir2angle(direction) + pick(90, -90))

	else if(prob(time_left * CONFUSION_DIAGONAL_MOVE_PROB_PER_SECOND))
		new_dir = angle2dir(dir2angle(direction) + pick(45, -45))

	if(!isnull(new_dir))
		move_args[MOVE_ARG_NEW_LOC] = get_step(owner, new_dir)
		move_args[MOVE_ARG_DIRECTION] = new_dir

#undef CONFUSION_FULL_THRESHOLD
#undef CONFUSION_SIDEWAYS_MOVE_PROB_PER_SECOND
#undef CONFUSION_DIAGONAL_MOVE_PROB_PER_SECOND
