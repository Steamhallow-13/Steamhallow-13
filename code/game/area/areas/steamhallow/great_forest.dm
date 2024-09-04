/// THE GREAT FOREST
// tl;dr - relatively pleasant forest at day; ominous woodwork at night. Outside of the wildwife the most present danger is either yourself or whatever nayer-do-well stumbles into you
// we're reusing junglegen for now since it's accessible for prototyping
/area/great_forest
	name = "The Great Forest"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "explored"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED
	// sound_environment = SOUND_AREA_LAVALAND
	// ambience_index = AMBIENCE_HOLY // temp
	outdoors = TRUE

/area/great_forest/unexplored
	icon_state = "unexplored"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED
	map_generator = /datum/map_generator/jungle_generator

/area/great_forest/unexplored/megafauna
	icon_state = "danger"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
