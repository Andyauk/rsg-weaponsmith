Config = {}

-- weaponsmith blip settings
Config.WeaponsmithBlip = {
    blipName = 'Weaponsmith', -- Config.Blip.blipName
    blipSprite = 'blip_shop_gunsmith', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- shop blip settings
Config.ShopBlip = {
    blipName = 'Weapon Shop', -- Config.Blip.blipName
    blipSprite = 'blip_shop_store', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- settings
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.Debug = false
Config.Keybind = 'J'

Config.WeaponShops = {

    {
        shopid = 'valweaponshop',
        shopname = 'Valentine Weapon Shop',
        coords = vector3(-282.5596, 780.56506, 119.52648),
        jobaccess = 'valweaponsmith',
        showblip = true
    },
    {
        shopid = 'rhoweaponshop',
        shopname = 'Valentine Weapon Shop',
        coords = vector3(1322.7214, -1321.552, 77.889106),
        jobaccess = 'rhoweaponsmith',
        showblip = true
    },
    {
        shopid = 'stdweaponshop',
        shopname = 'Saint Denis Weapon Shop',
        coords = vector3(2716.7294, -1285.322, 49.630462),
        jobaccess = 'stdweaponsmith',
        showblip = true
    },
    {
        shopid = 'tumweaponshop',
        shopname = 'Tumbleweed Weapon Shop',
        coords = vector3(-5508.215, -2964.114, -0.629247),
        jobaccess = 'tumweaponsmith',
        showblip = true
    },
    {
        shopid = 'annweaponshop',
        shopname = 'Annesburg Weapon Shop',
        coords = vector3(2946.5656, 1320.0002, 44.820243),
        jobaccess = 'annweaponsmith',
        showblip = true
    },
    
}

-- weaponsmith crafting locations
Config.WeaponCraftingPoint = {

    {   -- valentine
        name = 'Weapon Crafting',
        location = 'valweaponsmith',
        coords = vector3(-277.2185, 779.09729, 119.50399),
        job = 'valweaponsmith',
        showblip = true
    },
    {   -- rhodes
        name = 'Weapon Crafting',
        location = 'rhoweaponsmith',
        coords = vector3(1327.1809, -1322.01, 77.888885),
        job = 'rhoweaponsmith',
        showblip = true
    },
    {   -- stdenis
        name = 'Weapon Crafting',
        location = 'stdweaponsmith',
        coords = vector3(2710.5827, -1287.543, 49.636417),
        job = 'stdweaponsmith',
        showblip = true
    },
    {   -- tumbleweed
        name = 'Weapon Crafting',
        location = 'tumweaponsmith',
        coords = vector3(-5509.137, -2968.763, -0.629789),
        job = 'tumweaponsmith',
        showblip = true
    },
    {   -- annesburg
        name = 'Weapon Crafting',
        location = 'annweaponsmith',
        coords = vector3(2950.9912, 1316.7031, 44.820266),
        job = 'annweaponsmith',
        showblip = true
    },
	
}

Config.WeaponPartsCrafting = {

    {
        title =  'Trigger',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "trigger",
        giveamount = 1
    },
    {
        title =  'Hammer',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "hammer",
        giveamount = 1
    },
    {
        title =  'Barrel',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "barrel",
        giveamount = 1
    },
    {
        title =  'Spring',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "spring",
        giveamount = 1
    },
    {
        title =  'Frame',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "frame",
        giveamount = 1
    },
    {
        title =  'Grip',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "grip",
        giveamount = 1
    },
    {
        title =  'Cylinder',
        category = 'Parts',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "steel", amount = 1 },
        },
        receive = "cylinder",
        giveamount = 1
    },

}

Config.WeaponCrafting = {

    {
        title =  'Cattleman',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_cattleman",
        giveamount = 1
    },
    {
        title =  'Cattleman Mexican',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_cattleman_mexican",
        giveamount = 1
    },
    {
        title =  'Doubleaction Gambler',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_doubleaction_gambler",
        giveamount = 1
    },
    {
        title =  'Schofield',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_schofield",
        giveamount = 1
    },
    {
        title =  'Lemat',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_lemat",
        giveamount = 1
    },
    {
        title =  'Navy',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_navy",
        giveamount = 1
    },
    {
        title =  'Navy Crossover',
        category = 'Revolver',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_revolver_navy_crossover",
        giveamount = 1
    },
    {
        title =  'Volcanic',
        category = 'Pistol',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_pistol_volcanic",
        giveamount = 1
    },
    {
        title =  'M1899',
        category = 'Pistol',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_pistol_m1899",
        giveamount = 1
    },
    {
        title =  'Mauser',
        category = 'Pistol',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_pistol_mauser",
        giveamount = 1
    },
    {
        title =  'SemiAuto',
        category = 'Pistol',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_pistol_semiauto",
        giveamount = 1
    },
    {
        title =  'Carbine',
        category = 'Repeater',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_repeater_carbine",
        giveamount = 1
    },
    {
        title =  'Winchester',
        category = 'Repeater',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_repeater_winchester",
        giveamount = 1
    },
    {
        title =  'Henry',
        category = 'Repeater',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_repeater_henry",
        giveamount = 1
    },
    {
        title =  'Evans',
        category = 'Repeater',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_repeater_evans",
        giveamount = 1
    },
    {
        title =  'Varmint',
        category = 'Rifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_rifle_varmint",
        giveamount = 1
    },
    {
        title =  'Springfield',
        category = 'Rifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_rifle_springfield",
        giveamount = 1
    },
    {
        title =  'Boltaction',
        category = 'Rifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_rifle_boltaction",
        giveamount = 1
    },
    {
        title =  'Elephant',
        category = 'Rifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_rifle_elephant",
        giveamount = 1
    },
    {
        title =  'Double Barrel',
        category = 'Shotgun',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_shotgun_doublebarrel",
        giveamount = 1
    },
    {
        title =  'Double Barrel Exotic',
        category = 'Shotgun',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_shotgun_doublebarrel_exotic",
        giveamount = 1
    },
    {
        title =  'Sawedoff',
        category = 'Shotgun',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_shotgun_sawedoff",
        giveamount = 1
    },
    {
        title =  'Semi-Auto',
        category = 'Shotgun',
        icon = 'fa-solid fa-gun',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_shotgun_semiauto",
        giveamount = 1
    },
    {
        title =  'Pump',
        category = 'Shotgun',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_shotgun_pump",
        giveamount = 1
    },
    {
        title =  'Repeating',
        category = 'Shotgun',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_shotgun_repeating",
        giveamount = 1
    },
    {
        title =  'Rollingblock',
        category = 'Sniperrifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_sniperrifle_rollingblock",
        giveamount = 1
    },
    {
        title =  'Rollingblock Exotic',
        category = 'Sniperrifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_sniperrifle_rollingblock_exotic",
        giveamount = 1
    },
    {
        title =  'Carcano',
        category = 'Sniperrifle',
        crafttime = 30000,
        icon = 'fa-solid fa-gun',
        ingredients = { 
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = "weapon_sniperrifle_carcano",
        giveamount = 1
    },
}

Config.WeaponAmmoCrafting = {

    {
        title =  'Repeater',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_repeater",
        giveamount = 1
    },
    {
        title =  'Revolver',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_revolver",
        giveamount = 1
    },
    {
        title =  'Rifle',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_rifle",
        giveamount = 1
    },
    {
        title =  'Elephant Rifle',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_rifle_elephant",
        giveamount = 1
    },
    {
        title =  'Pistol',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_pistol",
        giveamount = 1
    },
    {
        title =  'Shotgun',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_shotgun",
        giveamount = 1
    },
    {
        title =  'Varmint',
        category = 'Ammo',
        crafttime = 30000,
        icon = 'fa-solid fa-person-rifle',
        ingredients = { 
            [1] = { item = 'copper',  amount = 1 },
            [2] = { item = 'steel',   amount = 1 },
        },
        receive = "ammo_varmint",
        giveamount = 1
    },

}