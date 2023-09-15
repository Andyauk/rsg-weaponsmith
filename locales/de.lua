local Translations = {
    error = {
      you_dont_have_the_required_items = "Du hast nicht die erforderlichen Gegenstände!",
      you_are_not_authorised = 'Du bist nicht autorisiert!',
    },
    success = {
      crafting_finished = 'Handwerk abgeschlossen',
    },
    primary = {

    },
    progressbar = {
      crafting_a = 'Handwerk: ',
    },
    label = {
      open_crafting_menu = 'Waffenwerkstatt-Menü öffnen'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
