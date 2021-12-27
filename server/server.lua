ESX = nil

TriggerEvent(eDAutoEcole.GetESX, function(obj) ESX = obj end)

RegisterNetEvent('</eDen:Achat')
AddEventHandler('</eDen:Achat', function(Type, Name, Price, Char)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if Type == "voiture" then
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
		TriggerClientEvent("</eDen:StartDriveTest", _src) 
        TriggerClientEvent('esx:showAdvancedNotification', _src, "Auto-Ecole", "Auto-Ecole", "Vous avez payez ~g~"..Price.."$", Char, 1)
    else 
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Auto-Ecole', 'Auto-Ecole', 'Vous n\'avez pas suffisament d\'argent !', Char, 1)
    end
  elseif Type == "moto" then
        if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        TriggerClientEvent("</eDen:StartDriveTestMoto", _src) 
        TriggerClientEvent('esx:showAdvancedNotification', _src, "Auto-Ecole", "Auto-Ecole", "Vous avez payez ~g~"..Price.."$", Char, 1)
    else 
        TriggerClientEvent('esx:showAdvancedNotification', _src, "Auto-Ecole", 'Auto-Ecole', 'Vous n\'avez pas suffisament d\'argent !', Char, 1)
    end
  elseif Type == "camion" then
    if xPlayer.getMoney() >= Price then
        xPlayer.removeMoney(Price)
        TriggerClientEvent("</eDen:StartDriveTestCamion", _src) 
        TriggerClientEvent('esx:showAdvancedNotification', _src,  "Auto-Ecole", "Auto-Ecole", "Vous avez payez ~g~"..Price.."$", Char, 1)
	else 
    	TriggerClientEvent('esx:showAdvancedNotification', _src, "Auto-Ecole", 'Auto-Ecole', 'Vous n\'avez pas suffisament d\'argent !', Char, 1)
    end
end
end)

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('</eDen:loadLicenses', source, licenses)
	end)
end)
  
RegisterNetEvent('</eDen:addLicense')
AddEventHandler('</eDen:addLicense', function(type)
	local _source = source
	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
		TriggerClientEvent('</eDen:loadLicenses', _source, licenses)
		end)
	end)
end)