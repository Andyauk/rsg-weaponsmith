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
                    args = { location },
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

-- weaponsmith part menu
RegisterNetEvent('rsg-weaponsmith:client:partsmenu', function()
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        exports['qr-menu']:openMenu({
            {
                header = 'Weapon Parts Crafting',
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
                header = "Weapon Crafting",
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-weaponsmith:client:partsmenu',
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

-----------------------------------------------------------------------------------

RegisterNetEvent('rsg-weaponsmith:client:storage', function(location)
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", currentlocation, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", currentlocation)
    end
end)

-----------------------------------------------------------------------------------
