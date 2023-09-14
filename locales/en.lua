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
      open_crafting_menu = 'Open Weaponsmith Menu'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
