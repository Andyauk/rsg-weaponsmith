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
                    title = Lang:t('label.parts_crafting'),
                    description = Lang:t('label.parts_crafting_sub'),
                    icon = 'fa-solid fa-screwdriver-wrench',
                    event = 'rsg-weaponsmith:client:partscraftingmenu',
                    arrow = true
                },
                {
                    title = Lang:t('label.weapon_crafting'),
                    description = Lang:t('label.weapon_crafting_sub',
                    icon = 'fa-solid fa-gun',
                    event = 'rsg-weaponsmith:client:weaponcraftingmenu',
                    arrow = true
                },
                {
                    title = Lang:t('label.ammo_crafting'),
                    description = Lang:t('label.ammo_crafting_sub'),
                    icon = 'fa-solid fa-person-rifle',
                    event = 'rsg-weaponsmith:client:ammocraftingmenu',
                    arrow = true
                },
                {
                    title = Lang:t('label.weapon_storage'),
                    description = Lang:t('label.weapon_storage_sub'),
                    icon = 'fas fa-box',
                    event = 'rsg-weaponsmith:client:storage',
                    arrow = true
                },
                {
                    title = Lang:t('label.repair_weapon'),
                    description = Lang:t('label.repair_weapon_sub'),
                    icon = 'fa-solid fa-hammer',
                    event = 'rsg-weapons:client:repairweapon',
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
        title = Lang:t('label.parts_crafting'),
        menu = 'weaponsmith_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, partsMenuData in pairs(partsCategoryMenus) do
        table.insert(partsMenu.options, {
            title = category,
            description = Lang:t('label.explore_options') .. category,
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
        title = Lang:t('label.weapon_crafting'),
        menu = 'weaponsmith_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, weaponMenuData in pairs(weaponCategoryMenus) do
        table.insert(weaponMenu.options, {
            title = category,
            description = Lang:t('label.explore_options') .. category,
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
        title = Lang:t('label.ammo_crafting'),
        menu = 'weaponsmith_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, ammoMenuData in pairs(ammoCategoryMenus) do
        table.insert(ammoMenu.options, {
            title = category,
            description = Lang:t('label.explore_options') .. category,
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
-- weaponsmith : inspect and clean held weapon : command = /inspect
------------------------------------------------------------------------------------------------------

RegisterNetEvent('rsg-weaponsmith:client:inspectweapon', function()
    local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
    local interaction = "LONGARM_HOLD_ENTER"
    local act = GetHashKey("LONGARM_CLEAN_ENTER")
    local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(),0))
    local cleaning = false 
    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), "GENERIC_WEAPON_CLEAN_PROMPT_AVAILABLE", true, -1)
    if Citizen.InvokeNative(0xD955FEE4B87AFA07,weaponHash) then
        interaction = "SHORTARM_HOLD_ENTER"
        act = GetHashKey("SHORTARM_CLEAN_ENTER")
    end
    if weaponHash ~= -1569615261 then
        TaskItemInteraction(PlayerPedId(), weaponHash, GetHashKey(interaction), 0,0,0) 
        showstats()
        while not Citizen.InvokeNative(0xEC7E480FF8BD0BED,PlayerPedId()) do
            Wait(300)
        end          
        while Citizen.InvokeNative(0xEC7E480FF8BD0BED,PlayerPedId()) do
            Wait(1) 
            if IsDisabledControlJustReleased(0,3002300392) then
                ClearPedTasks(PlayerPedId(),1,1)
                Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)            
            end
            if IsDisabledControlJustReleased(0,3820983707) and not cleaning then
                cleaning = true 
                local Cloth= CreateObject(GetHashKey('s_balledragcloth01x'), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
                local PropId = GetHashKey("CLOTH")
                Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), 1242464081, Cloth, PropId, act, 1, 0, -1.0)  
                Wait(9500) 
                ClearPedTasks(PlayerPedId(),1,1)
                Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)
                Citizen.InvokeNative(0xA7A57E89E965D839,object,0.0,0)
                Citizen.InvokeNative(0x812CE61DEBCAB948,object,0.0,0)
                break
            end
        end
        Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)    
    end
end)

function showstats()
    local _, weapon = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
    if weapon then    
        local uiFlowBlock = RequestFlowBlock(GetHashKey("PM_FLOW_WEAPON_INSPECT"))
        local uiContainer = DatabindingAddDataContainerFromPath("" , "ItemInspection")
        Citizen.InvokeNative(0x46DB71883EE9D5AF, uiContainer, "stats", getWeaponStats(weapon), PlayerPedId())
        DatabindingAddDataString(uiContainer, "tipText", 'Weapon Information')
        DatabindingAddDataHash(uiContainer, "itemLabel", weapon)
        DatabindingAddDataBool(uiContainer, "Visible", true)

        Citizen.InvokeNative(0x10A93C057B6BD944, uiFlowBlock)
        Citizen.InvokeNative(0x3B7519720C9DCB45, uiFlowBlock, 0)
        Citizen.InvokeNative(0x4C6F2C4B7A03A266, -813354801, uiFlowBlock)
    end
end

function getWeaponStats(weaponHash) 
    local emptyStruct = DataView.ArrayBuffer(256)
    local charStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, emptyStruct:Buffer(), GetHashKey("CHARACTER"), -1591664384, charStruct:Buffer())
        
    local unkStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, charStruct:Buffer(), 923904168, -740156546, unkStruct:Buffer())

    local weaponStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, unkStruct:Buffer(), weaponHash, -1591664384, weaponStruct:Buffer())
    return weaponStruct:Buffer()
end
