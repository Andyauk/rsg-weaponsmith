local Translations = {
    error = {
      you_dont_have_the_required_items = "You don\'t have the required items!",
      you_are_not_authorised = 'you are not authorised!',
    },
    success = {
      crafting_finished = 'crafting finished',
    },
    primary = {

    },
    progressbar = {
      crafting_a = 'Crafting : ',
    },
    label = {
      open_crafting_menu = 'Open Weaponsmith Menu',
      parts_crafting = 'Parts Crafting',
      parts_crafting_sub = 'craft weapon parts',
      weapon_crafting = 'Weapon Crafting',
      weapon_crafting_sub = 'craft weapons',
      ammo_crafting = 'Ammo Crafting',
      ammo_crafting_sub = 'craft weapon ammo',
      weapon_storage = 'Weaponsmith Storage',
      weapon_storage_sub = 'storage for weaponsmith',
      repair_weapon = 'Repair Held Weapon',
      repair_weapon_sub = 'repair the weapon you are holding',
      explore_options = 'Explore the crafing options for ',
      inspect = 'inspect held weapon',
      boss_menu = 'inspect held weapon',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
