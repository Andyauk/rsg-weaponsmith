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
      open_crafting_menu = 'Waffenschmied-Menü öffnen',
      parts_crafting = 'Teileherstellung',
      parts_crafting_sub = 'Waffenkomponenten herstellen',
      weapon_crafting = 'Waffenherstellung',
      weapon_crafting_sub = 'Waffen herstellen',
      ammo_crafting = 'Munitionsherstellung',
      ammo_crafting_sub = 'Waffenmunition herstellen',
      weapon_storage = 'Waffenschmied-Lager',
      weapon_storage_sub = 'Lagerung für Waffenschmiede',
      repair_weapon = 'Waffe reparieren',
      repair_weapon_sub = 'Die ausgerüstete Waffe reparieren',
      explore_options = 'Erkunde die Herstellungsoptionen für ',
      inspect = 'Ausgerüstete Waffe inspizieren',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('label.inspect')
