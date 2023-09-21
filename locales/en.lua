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
      boss_menu = 'Boss Menu',
      boss_menu_sub = 'open boss menu',
    },

    lang_s1 = 'Open Weapon Shop',
    lang_s2 = 'Weapon Shop Owner Menu',
    lang_s3 = 'View Shop Items',
    lang_s4 = 'view the weapon shop items',
    lang_s5 = 'Refill Weapon Shop',
    lang_s6 = 'refill your stock',
    lang_s7 = 'View Weaponshop Money',
    lang_s8 = 'check and withdraw weapon shop money',
    lang_s9 = 'Weapon Shop Customer Menu',
    lang_s10 = 'Weaponsmith Shop',
    lang_s11 = 'view items for sale',
    lang_s12 = 'Unit price: $',
    lang_s13 = 'Shop Menu',
    lang_s14 = 'Weaponsmith Stock',
    lang_s15 = 'How many?',
    lang_s16 = 'must have the amount in your inventory',
    lang_s17 = 'Sell Price',
    lang_s18 = 'example: 0.10',
    lang_s19 = 'Something went wrong, check you have the correct amount and price!',
    lang_s20 = 'Invalid Amount',
    lang_s21 = 'Balance : $',
    lang_s22 = 'Withdraw money',
    lang_s23 = 'The money will be given to you in cash!',
    lang_s24 = 'Max Withdraw: $',
    lang_s25 = '(case sensitive box)',
    lang_s26 = 'added to weaponshop',
    lang_s27 = 'added to weaponshop',
    lang_s28 = 'You lack money',
    lang_s29 = 'No Items',
    lang_s30 = 'no stock items to add',
    lang_s31 = 'stock replenishment',

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
