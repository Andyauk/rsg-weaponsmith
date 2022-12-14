local QRCore = exports['qr-core']:GetCoreObject()

-----------------------------------------------------------------------------------

-- use cleankit
QRCore.Functions.CreateUseableItem("cleankit", function(source, item)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-weaponsmith:client:serviceweapon', src, 'cleankit', 1)
end)

-----------------------------------------------------------------------------------

-- check player has items
QRCore.Functions.CreateCallback('rsg-weaponsmith:server:checkitems', function(source, cb, craftitems)
    local src = source
    local hasItems = false
    local icheck = 0
    local Player = QRCore.Functions.GetPlayer(src)
    for k, v in pairs(craftitems) do
        if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount then
            icheck = icheck + 1
            if icheck == #craftitems then
                cb(true)
            end
        else
            TriggerClientEvent('QRCore:Notify', src, 'You don\'t have the required items!', 'error')
            cb(false)
            return
        end
    end
end)

-----------------------------------------------------------------------------------

-- finish crafting
RegisterServerEvent('rsg-weaponsmith:server:finishcrafting')
AddEventHandler('rsg-weaponsmith:server:finishcrafting', function(craftitems, receive)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
    -- remove craftitems
    for k, v in pairs(craftitems) do
        if Config.Debug == true then
            print(v.item)
            print(v.amount)
        end
        Player.Functions.RemoveItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[v.item], "remove")
    end
    -- add items
    Player.Functions.AddItem(receive, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[receive], "add")
    TriggerClientEvent('QRCore:Notify', src, 'crafting finished', 'success')
end)

-----------------------------------------------------------------------------------
