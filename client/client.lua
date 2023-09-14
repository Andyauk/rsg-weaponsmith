local RSGCore = exports['rsg-core']:GetCoreObject()
local options = {}
local jobaccess

------------------------------------------------------------------------------------------------------

-- crafting locations
Citizen.CreateThread(function()
    for crafting, v in pairs(Config.WeaponCraftingPoint) do
        exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds[Config.Keybind], Lang:t('label.open_crafting_menu'), {
            type = 'client',
            event = 'rsg-weaponsmith:client:mainmenu',
            args = { v.job },
        })
        if v.showblip == true then
            local CraftingBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(CraftingBlip, 3535996525, 1)
            SetBlipScale(CraftingBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, CraftingBlip, v.name)
        end
    end
end)

------------------------------------------------------------------------------------------------------
-- weapon main menu
------------------------------------------------------------------------------------------------------

RegisterNetEvent('rsg-weaponsmith:client:mainmenu', function(job)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name
    jobaccess = job
    if playerjob == jobaccess then
        lib.registerContext({
            id = 'weaponsmith_mainmenu',
            title = 'Weaponsmith Menu',
            options = {
                {
                    title = 'Parts Crafting',
                    description = 'craft weapon parts',
                    icon = 'fa-solid fa-screwdriver-wrench',
                    event = 'rsg-weaponsmith:client:partscraftingmenu',
                    arrow = true
                },
                {
                    title = 'Weapon Crafting',
                    description = 'craft weapons',
                    icon = 'fa-solid fa-gun',
                    event = 'rsg-weaponsmith:client:weaponcraftingmenu',
                    arrow = true
                },
                {
                    title = 'Ammo Crafting',
                    description = 'craft weapon ammo',
                    icon = 'fa-solid fa-person-rifle',
                    event = 'rsg-weaponsmith:client:ammocraftingmenu',
                    arrow = true
                },
                {
                    title = 'Weaponsmith Storage',
                    description = 'storage for weaponsmith',
                    icon = 'fas fa-box',
                    event = 'rsg-weaponsmith:client:storage',
                    arrow = true
                },
            }
        })
        lib.showContext("weaponsmith_mainmenu")
    else
        RSGCore.Functions.Notify(Lang:t('error.you_are_not_authorised'), 'error')
    end
end)

------------------------------------------------------------------------------------------------------
-- weapon parts crafting menu
------------------------------------------------------------------------------------------------------

-- create a table to store weapon menu options by category
local partsCategoryMenus = {}

-- iterate through recipes and organize them by category
for _, v in ipairs(Config.WeaponPartsCrafting) do
    local partsIngredientsMetadata = {}

    for i, ingredient in ipairs(v.ingredients) do
        table.insert(partsIngredientsMetadata, { label = RSGCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
    end
    local option = {
        title = v.title,
        icon = v.icon,
        event = 'rsg-weaponsmith:client:checkingredients',
        metadata = partsIngredientsMetadata,
        args = {
            title = v.title,
            category = v.category,
            ingredients = v.ingredients,
            crafttime = v.crafttime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    }

    -- check if a menu already exists for this category
    if not partsCategoryMenus[v.category] then
        partsCategoryMenus[v.category] = {
            id = 'partscrafting_menu_' .. v.category,
            title = v.category,
            menu = 'weaponsmith_mainmenu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(partsCategoryMenus[v.category].options, option)
    end
end

-- log menu events by category
for category, partsMenuData in pairs(partsCategoryMenus) do
    RegisterNetEvent('rsg-weaponsmith:client:' .. category)
    AddEventHandler('rsg-weaponsmith:client:' .. category, function()
        lib.registerContext(partsMenuData)
        lib.showContext(partsMenuData.id)
    end)
end

-- main event to open parts main menu
RegisterNetEvent('rsg-weaponsmith:client:partscraftingmenu')
AddEventHandler('rsg-weaponsmith:client:partscraftingmenu', function()
    -- show main menu with categories
    local partsMenu = {
        id = 'partscrafting_menu',
        title = 'Parts Crafting',
        menu = 'weaponsmith_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, partsMenuData in pairs(partsCategoryMenus) do
        table.insert(partsMenu.options, {
            title = category,
            description = 'Explore the crafing options for ' .. category,
            icon = 'fa-solid fa-pen-ruler',
            event = 'rsg-weaponsmith:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(partsMenu)
    lib.showContext(partsMenu.id)
end)

------------------------------------------------------------------------------------------------------
-- weapon crafting menu
------------------------------------------------------------------------------------------------------

-- create a table to store weapon menu options by category
local weaponCategoryMenus = {}

-- iterate through recipes and organize them by category
for _, v in ipairs(Config.WeaponCrafting) do
    local weaponIngredientsMetadata = {}

    for i, ingredient in ipairs(v.ingredients) do
        table.insert(weaponIngredientsMetadata, { label = RSGCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
    end
    local option = {
        title = v.title,
        icon = v.icon,
        event = 'rsg-weaponsmith:client:checkingredients',
        metadata = weaponIngredientsMetadata,
        args = {
            title = v.title,
            category = v.category,
            ingredients = v.ingredients,
            crafttime = v.crafttime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    }

    -- check if a menu already exists for this category
    if not weaponCategoryMenus[v.category] then
        weaponCategoryMenus[v.category] = {
            id = 'weaponcrafting_menu_' .. v.category,
            title = v.category,
            menu = 'weaponsmith_mainmenu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(weaponCategoryMenus[v.category].options, option)
    end
end

-- log menu events by category
for category, weaponMenuData in pairs(weaponCategoryMenus) do
    RegisterNetEvent('rsg-weaponsmith:client:' .. category)
    AddEventHandler('rsg-weaponsmith:client:' .. category, function()
        lib.registerContext(weaponMenuData)
        lib.showContext(weaponMenuData.id)
    end)
end

-- main event to open weapon main menu
RegisterNetEvent('rsg-weaponsmith:client:weaponcraftingmenu')
AddEventHandler('rsg-weaponsmith:client:weaponcraftingmenu', function()
    -- show main menu with categories
    local weaponMenu = {
        id = 'weaponcrafting_menu',
        title = 'Weapon Crafting',
        menu = 'weaponsmith_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, weaponMenuData in pairs(weaponCategoryMenus) do
        table.insert(weaponMenu.options, {
            title = category,
            description = 'Explore the crafing options for ' .. category,
            icon = 'fa-solid fa-pen-ruler',
            event = 'rsg-weaponsmith:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(weaponMenu)
    lib.showContext(weaponMenu.id)
end)

------------------------------------------------------------------------------------------------------
-- weapon ammo crafting menu
------------------------------------------------------------------------------------------------------

-- create a table to store weapon menu options by category
local ammoCategoryMenus = {}

-- iterate through recipes and organize them by category
for _, v in ipairs(Config.WeaponAmmoCrafting) do
    local ammoIngredientsMetadata = {}

    for i, ingredient in ipairs(v.ingredients) do
        table.insert(ammoIngredientsMetadata, { label = RSGCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
    end
    local option = {
        title = v.title,
        icon = v.icon,
        event = 'rsg-weaponsmith:client:checkingredients',
        metadata = ammoIngredientsMetadata,
        args = {
            title = v.title,
            category = v.category,
            ingredients = v.ingredients,
            crafttime = v.crafttime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    }

    -- check if a menu already exists for this category
    if not ammoCategoryMenus[v.category] then
        ammoCategoryMenus[v.category] = {
            id = 'ammocrafting_menu_' .. v.category,
            title = v.category,
            menu = 'weaponsmith_mainmenu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(ammoCategoryMenus[v.category].options, option)
    end
end

-- log menu events by category
for category, ammoMenuData in pairs(ammoCategoryMenus) do
    RegisterNetEvent('rsg-weaponsmith:client:' .. category)
    AddEventHandler('rsg-weaponsmith:client:' .. category, function()
        lib.registerContext(ammoMenuData)
        lib.showContext(ammoMenuData.id)
    end)
end

-- main event to open ammo main menu
RegisterNetEvent('rsg-weaponsmith:client:ammocraftingmenu')
AddEventHandler('rsg-weaponsmith:client:ammocraftingmenu', function()
    -- show main menu with categories
    local ammoMenu = {
        id = 'ammocrafting_menu',
        title = 'Ammo Crafting',
        menu = 'weaponsmith_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, ammoMenuData in pairs(ammoCategoryMenus) do
        table.insert(ammoMenu.options, {
            title = category,
            description = 'Explore the crafing options for ' .. category,
            icon = 'fa-solid fa-pen-ruler',
            event = 'rsg-weaponsmith:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(ammoMenu)
    lib.showContext(ammoMenu.id)
end)

------------------------------------------------------------------------------------------------------
-- do crafting stuff
------------------------------------------------------------------------------------------------------

-- check player has the ingredients to craft item
RegisterNetEvent('rsg-weaponsmith:client:checkingredients', function(data)
    RSGCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkingredients', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:craftitem', data.title, data.category, data.ingredients, tonumber(data.crafttime), data.receive, data.giveamount)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, data.ingredients)
end)

-- do crafting
RegisterNetEvent('rsg-weaponsmith:client:craftitem', function(title, category, ingredients, crafttime, receive, giveamount)
    RSGCore.Functions.Progressbar('do-crafting', Lang:t('progressbar.crafting_a')..title..' '..category, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', ingredients, receive, giveamount)
    end)
end)

------------------------------------------------------------------------------------------------------
-- weaponsmith storage
------------------------------------------------------------------------------------------------------

RegisterNetEvent('rsg-weaponsmith:client:storage', function()
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name
    if playerjob == jobaccess then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", jobaccess, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", jobaccess)
    end
end)

------------------------------------------------------------------------------------------------------