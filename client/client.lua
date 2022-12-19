local QRCore = exports['qr-core']:GetCoreObject()
local currentlocation
isLoggedIn = false

-----------------------------------------------------------------------------------

-- prompts and blips
CreateThread(function()
    for weaponsmith, v in pairs(Config.WeaponCraftingPoint) do
        exports['qr-core']:createPrompt(v.location, v.coords, QRCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'rsg-weaponsmith:client:mainmenu',
            args = { v.location },
        })
        if v.showblip == true then
            local WeaponSmithBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(WeaponSmithBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(WeaponSmithBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, WeaponSmithBlip, Config.Blip.blipName)
        end
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            local job = QRCore.Functions.GetPlayerData().job.name
            if job == Config.JobRequired then
                for weaponsmith, v in pairs(Config.WeaponCraftingPoint) do
                    if v.showmarker == true then
                        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-----------------------------------------------------------------------------------

-- weaponsmith menu
RegisterNetEvent('rsg-weaponsmith:client:mainmenu', function(location)
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        currentlocation = location
        exports['qr-menu']:openMenu({
            {
                header = 'Weapon Crafting',
                isMenuHeader = true,
            },
            {
                header = "Weapon Parts Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:partsmenu',
                    isServer = false,
                }
            },
            {
                header = "Weapon Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:weaponmenu',
                    isServer = false,
                }
            },
            {
                header = "Weaponsmith Storage",
                txt = "",
                icon = "fas fa-box",
                params = {
                    event = 'rsg-weaponsmith:client:storage',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = ">> Close Menu <<",
                txt = '',
                params = {
                    event = 'qr-menu:closeMenu',
                }
            },
        })
    else
        QRCore.Functions.Notify('you are not a Weaponsmith!', 'error')
    end
end)

-- parts menu
RegisterNetEvent('rsg-weaponsmith:client:partsmenu', function()
    partsMenu = {}
    partsMenu = {
        {
            header = "Weapon Parts Crafting",
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.WeaponPartsCrafting) do
        partsMenu[#partsMenu + 1] = {
            header = v.lable,
            txt = text,
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-weaponsmith:client:partscheckitems',
                args = {
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    partsMenu[#partsMenu + 1] = {
        header = "<< Back",
        txt = '',
        params = {
            event = 'rsg-weaponsmith:client:mainmenu',
        }
    }
    exports['qr-menu']:openMenu(partsMenu)
end)

-- weaponsmith weapon menu
RegisterNetEvent('rsg-weaponsmith:client:weaponmenu', function()
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        exports['qr-menu']:openMenu({
            {
                header = 'Weapon Crafting',
                isMenuHeader = true,
            },
            {
                header = "Revolver Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:revlovermenu',
                    isServer = false,
                }
            },
            {
                header = "Pistol Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:pistolmenu',
                    isServer = false,
                }
            },
            {
                header = "Repeater Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:repeatermenu',
                    isServer = false,
                }
            },
            {
                header = "Rifle Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:riflemenu',
                    isServer = false,
                }
            },
            {
                header = "Shotgun Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:shotgunmenu',
                    isServer = false,
                }
            },
            {
                header = "<< Back",
                txt = '',
                params = {
                    event = 'rsg-weaponsmith:client:mainmenu',
                }
            },
        })
    else
        QRCore.Functions.Notify('you are not a Weaponsmith!', 'error')
    end
end)

-- revlover menu
RegisterNetEvent('rsg-weaponsmith:client:revlovermenu', function()
    revloverMenu = {}
    revloverMenu = {
        {
            header = "Revolver Crafting",
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.RevloverCrafting) do
        revloverMenu[#revloverMenu + 1] = {
            header = v.lable,
            txt = '',
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-weaponsmith:client:checkrevloveritems',
                args = {                
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    revloverMenu[#revloverMenu + 1] = {
        header = "<< Back",
        txt = '',
        params = {
            event = 'rsg-weaponsmith:client:mainmenu',
        }
    }
    exports['qr-menu']:openMenu(revloverMenu)
end)

-- pistol menu
RegisterNetEvent('rsg-weaponsmith:client:pistolmenu', function()
    pistolMenu = {}
    pistolMenu = {
        {
            header = "Pistol Crafting",
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.PistolCrafting) do
        pistolMenu[#pistolMenu + 1] = {
            header = v.lable,
            txt = '',
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-weaponsmith:client:checkpistolitems',
                args = {                
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    pistolMenu[#pistolMenu + 1] = {
        header = "<< Back",
        txt = '',
        params = {
            event = 'rsg-weaponsmith:client:mainmenu',
        }
    }
    exports['qr-menu']:openMenu(pistolMenu)
end)

-- repeater menu
RegisterNetEvent('rsg-weaponsmith:client:repeatermenu', function()
    repeaterMenu = {}
    repeaterMenu = {
        {
            header = "Repeater Crafting",
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.RepeaterCrafting) do
        repeaterMenu[#repeaterMenu + 1] = {
            header = v.lable,
            txt = '',
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-weaponsmith:client:checkrepeateritems',
                args = {                
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    repeaterMenu[#repeaterMenu + 1] = {
        header = "<< Back",
        txt = '',
        params = {
            event = 'rsg-weaponsmith:client:mainmenu',
        }
    }
    exports['qr-menu']:openMenu(repeaterMenu)
end)

-- rifle menu
RegisterNetEvent('rsg-weaponsmith:client:riflemenu', function()
    rifleMenu = {}
    rifleMenu = {
        {
            header = "Rifle Crafting",
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.RifleCrafting) do
        rifleMenu[#rifleMenu + 1] = {
            header = v.lable,
            txt = '',
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-weaponsmith:client:checkrifleitems',
                args = {                
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    rifleMenu[#rifleMenu + 1] = {
        header = "<< Back",
        txt = '',
        params = {
            event = 'rsg-weaponsmith:client:mainmenu',
        }
    }
    exports['qr-menu']:openMenu(rifleMenu)
end)

-- shotgun menu
RegisterNetEvent('rsg-weaponsmith:client:shotgunmenu', function()
    shotgunMenu = {}
    shotgunMenu = {
        {
            header = "Shotgun Crafting",
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.ShotgunCrafting) do
        shotgunMenu[#shotgunMenu + 1] = {
            header = v.lable,
            txt = '',
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-weaponsmith:client:checkshotgunitems',
                args = {                
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    shotgunMenu[#shotgunMenu + 1] = {
        header = "<< Back",
        txt = '',
        params = {
            event = 'rsg-weaponsmith:client:mainmenu',
        }
    }
    exports['qr-menu']:openMenu(shotgunMenu)
end)

------------------------------------------------------------------------------------------------------

-- parts crafting : check player has the items
RegisterNetEvent('rsg-weaponsmith:client:partscheckitems', function(data)
    QRCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:startpartscrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.WeaponPartsCrafting[data.item].craftitems)
end)

-- revovler crafting : check player has the items
RegisterNetEvent('rsg-weaponsmith:client:checkrevloveritems', function(data)
    QRCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:startrevlovercrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.RevloverCrafting[data.item].craftitems)
end)

-- pistol crafting : check player has the items
RegisterNetEvent('rsg-weaponsmith:client:checkpistolitems', function(data)
    QRCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:startrpistolcrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.PistolCrafting[data.item].craftitems)
end)

-- repeater crafting : check player has the items
RegisterNetEvent('rsg-weaponsmith:client:checkrepeateritems', function(data)
    QRCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:startrepeatercrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.RepeaterCrafting[data.item].craftitems)
end)

-- rifle crafting : check player has the items
RegisterNetEvent('rsg-weaponsmith:client:checkrifleitems', function(data)
    QRCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:startriflecrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.RifleCrafting[data.item].craftitems)
end)

-- shotgun crafting : check player has the items
RegisterNetEvent('rsg-weaponsmith:client:checkshotgunitems', function(data)
    QRCore.Functions.TriggerCallback('rsg-weaponsmith:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-weaponsmith:client:startshotguncrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.ShotgunCrafting[data.item].craftitems)
end)

------------------------------------------------------------------------------------------------------

-- start parts crafting
RegisterNetEvent('rsg-weaponsmith:client:startpartscrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.WeaponPartsCrafting[item].craftitems
    QRCore.Functions.Progressbar('craft-parts', 'Crafting a '..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', craftitems, receive)
    end)
end)

-- start revlover crafting
RegisterNetEvent('rsg-weaponsmith:client:startrevlovercrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.RevloverCrafting[item].craftitems
    QRCore.Functions.Progressbar('craft-revlover', 'Crafting a '..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', craftitems, receive)
    end)
end)

-- start pistol crafting
RegisterNetEvent('rsg-weaponsmith:client:startpistolcrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.PistolCrafting[item].craftitems
    QRCore.Functions.Progressbar('craft-pistol', 'Crafting a '..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', craftitems, receive)
    end)
end)

-- start repeater crafting
RegisterNetEvent('rsg-weaponsmith:client:startrepeatercrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.RepeaterCrafting[item].craftitems
    QRCore.Functions.Progressbar('craft-repeater', 'Crafting a '..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', craftitems, receive)
    end)
end)

-- start rifle crafting
RegisterNetEvent('rsg-weaponsmith:client:startriflecrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.RifleCrafting[item].craftitems
    QRCore.Functions.Progressbar('craft-rifle', 'Crafting a '..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', craftitems, receive)
    end)
end)

-- start shotgun crafting
RegisterNetEvent('rsg-weaponsmith:client:startshotguncrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.ShotgunCrafting[item].craftitems
    QRCore.Functions.Progressbar('craft-shotgun', 'Crafting a '..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-weaponsmith:server:finishcrafting', craftitems, receive)
    end)
end)

-----------------------------------------------------------------------------------

RegisterNetEvent('rsg-weaponsmith:client:storage', function()
    local job = QRCore.Functions.GetPlayerData().job.name
    local stashloc = currentlocation
    if job == Config.JobRequired then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashloc, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashloc)
    end
end)

-----------------------------------------------------------------------------------

-- clean/inspect weapon
RegisterNetEvent('rsg-weaponsmith:client:serviceweapon', function(item, amount)
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        local ped = PlayerPedId()
        local cloth = CreateObject(`s_balledragcloth01x`, GetEntityCoords(PlayerPedId()), false, true, false, false, true)
        local PropId = `CLOTH`
        local actshort = `SHORTARM_CLEAN_ENTER`
        local actlong = `LONGARM_CLEAN_ENTER`
        local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), false, weaponHash, false)
        local model = GetWeapontypeGroup(weaponHash)
        local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0))
        if Config.Debug == true then
            print("Weapon Group --> "..model)
            print("Weapon Hash --> "..weaponHash)        
        end
        if weaponHash ~= `WEAPON_UNARMED` then
            if model == 416676503 or model == -1101297303 then
                Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), "", cloth, PropId, actshort, 1, 0, -1.0) -- TaskItemInteraction_2
                Wait(15000)
                Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0, false) -- SetWeaponDegradation
                Citizen.InvokeNative(0xE22060121602493B, object, 0.0, false) -- SetWeaponDamage
                Citizen.InvokeNative(0x812CE61DEBCAB948, object, 0.0, false) -- SetWeaponDirt
                Citizen.InvokeNative(0xA9EF4AD10BDDDB57, object, 0.0, false) -- SetWeaponSoot
                QRCore.Functions.Notify('weapon cleaned', 'success')
            else
                Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), "", cloth, PropId, actlong, 1, 0, -1.0) -- TaskItemInteraction_2 
                Wait(15000)
                Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0, false) -- SetWeaponDegradation
                Citizen.InvokeNative(0xE22060121602493B, object, 0.0, false) -- SetWeaponDamage
                Citizen.InvokeNative(0x812CE61DEBCAB948, object, 0.0, false) -- SetWeaponDirt
                Citizen.InvokeNative(0xA9EF4AD10BDDDB57, object, 0.0, false) -- SetWeaponSoot
                QRCore.Functions.Notify('weapon cleaned', 'success')
            end
        else
            QRCore.Functions.Notify('you must be holding the weapon!', 'error')
        end
    else
        QRCore.Functions.Notify('you are not a Weaponsmith!', 'error')
    end
end)

-----------------------------------------------------------------------------------
