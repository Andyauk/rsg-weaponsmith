local Translations = {
error = {
    you_dont_have_the_required_items = "Você não possui os itens necessários!",
},
success = {
    crafting_finished = 'fabricação concluída',
},
progressbar = {
    crafting_a = 'Fabricando um(a) ',
},
label = {
    open_crafting_menu = 'Abrir Menu de Fabricação'
}
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
