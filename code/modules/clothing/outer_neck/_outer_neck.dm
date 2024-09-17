/obj/item/clothing/outer_neck
	name = "thick necklace"
	icon = 'icons/obj/clothing/neck.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_O_NECK
	interaction_flags_click = NEED_DEXTERITY
	strip_delay = 40
	equip_delay_other = 40

/obj/item/clothing/inner_neck/worn_overlays(mutable_appearance/standing, isinhands = FALSE)
	. = ..()
	if(isinhands)
		return

	if(body_parts_covered & HEAD)
		if(damaged_clothes)
			. += mutable_appearance('icons/effects/item_damage.dmi', "damagedmask")
		if(GET_ATOM_BLOOD_DNA_LENGTH(src))
			. += mutable_appearance('icons/effects/blood.dmi', "maskblood")
