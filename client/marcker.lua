ESX = nil
local AutoEcoleShop = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(eDAutoEcole.GetESX, function(obj) ESX = obj end)
        Citizen.Wait(10)
        InitMarkerAutoEcoleShop()
    end
end)

InitMarkerAutoEcoleShop = function()
    AutoEcoleShopZone = true
    Citizen.CreateThread(function()
        for _, v in pairs(eDAutoEcole.AutoEcole.Infos.Blips) do
        local blip = AddBlipForCoord(v.Position)
        SetBlipSprite(blip, v.Sprite)
        SetBlipScale(blip, v.Scale)
        SetBlipColour(blip, v.Colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Name)
        EndTextCommandSetBlipName(blip)
    end
        while AutoEcoleShopZone do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
            for _, v in pairs(eDAutoEcole.AutoEcole.Infos.Marcker.PositionAutoEcole) do
                local dst1 = GetDistanceBetweenCoords(playerPos, v.pos, true)
                    if dst1 < 4.0 then
                    InZone = true
                    DrawMarker(20, v.pos, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 0, 180, 0, 255, true, true, p19, true) 
                    if dst1 < 2.0 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour intéragir Menu Shop ~b~Auto-Ecole")
                        if IsControlJustReleased(1, 38) then
                            OpenMenuAutoEcole()
                        end
                    end
                end
            end
            if not InZone then
                Wait(500)
            else
            Wait(1)
        end
    end
    end)
    print("Le Auto-Ecole a Bien chargé !")
    print("By eDen and Aurezia")
end


