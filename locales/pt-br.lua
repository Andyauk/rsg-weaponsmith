local Translations = {
error = {
    you_are_not_authorised = 'você não está autorizado!',
    you_must_be_holding_weapon = 'você deve estar segurando a arma!',
    you_dont_have_the_required_items = "Você não possui os itens necessários!",
},
success = {
    weapon_cleaned = 'arma limpa',
    crafting_finished = 'criação concluída',
},
primary = {
    var = 'o texto vai aqui',
},
menu = {
    open = 'Abrir ',
    weapon_crafting = 'Criação de Armas',
    weapon_parts_crafting = 'Criação de Peças de Armas',
    weaponsmith_storage = 'Armazenamento do Armeiro',
    job_management = 'Gerenciamento de Trabalho',
    close_menu = '>> Fechar Menu <<',
    revolver_crafting = 'Criação de Revólver',
    pistol_crafting = 'Criação de Pistola',
    repeater_crafting = 'Criação de Carabina',
    rifle_crafting = 'Criação de Rifle',
    shotgun_crafting = 'Criação de Espingarda',
},
commands = {
    var = 'o texto vai aqui',
},
progressbar = {
    crafting_a = 'Fabricando um(a) ',
},
text = {
    var = 'o texto vai aqui',
}
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
