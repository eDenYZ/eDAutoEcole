local CurrentTest = nil
local CurrentCheckPoint = 0
local DriveErrors = 0
local LastCheckPoint = -1
local CurrentBlip = nil
local CurrentZoneType = nil
local IsAboveSpeedLimit = false
local VehicleHealth = nil
local success = false
local startedconduite = false
local drivetest = nil
local CurrentTestType = nil
local Licenses = {}
local permisencours = ""

function SetZoneTypeVille(type)
    ZoneTypeVille = type
end

function StopDriveTest(success)
	if success then
		TriggerServerEvent('</eDen:addLicense', permisencours)
		RemoveBlip(CurrentBlip)
		ESX.ShowAdvancedNotification(eDAutoEcole.AutoEcole.Infos.NomDuMonitor, '~r~Bravo~w~', 'Vous avez reçu votre permis !', eDAutoEcole.AutoEcole.Infos.CHAR)
		if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) then
			DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
			SetVehicleAsNoLongerNeeded(GetVehiclePedIsIn(PlayerPedId(), false))
		end
		if DoesEntityExist(pedssss) then
			DeleteEntity(pedssss)
		end
	else
		if DoesEntityExist(pedssss) then
			DeleteEntity(pedssss)
		end
		ESX.ShowAdvancedNotification(eDAutoEcole.AutoEcole.Infos.NomDuMonitor, '~r~Malheureusement~w~', 'Vous avez raté le test !', eDAutoEcole.AutoEcole.Infos.CHAR)			
		if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) then
			DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
			SetVehicleAsNoLongerNeeded(GetVehiclePedIsIn(PlayerPedId(), false))
		end
	end
	SetEntityCoords(pietonped, 394.12, -111.84, 65.23, false, false, false, true)
	SetEntityHeading(pietonped, 234.62)
	CurrentTest     = nil
	CurrentTestType = nil
end

function StartConduite()
	startedconduite = true
	while startedconduite do
		Wait(0)

		if CurrentTest == 'drive' then

			local nextCheckPoint = CurrentCheckPoint + 1

			if eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint] == nil then
				if DoesBlipExist(CurrentBlip) then
					RemoveBlip(CurrentBlip)
				end

				CurrentTest = nil

				while not IsPedheadshotReady(RegisterPedheadshot(PlayerPedId())) or not IsPedheadshotValid(RegisterPedheadshot(PlayerPedId())) do
					Wait(100)
				end
		
				BeginTextCommandThefeedPost("PS_UPDATE")
				AddTextComponentInteger(50)
			
				EndTextCommandThefeedPostStats("PSF_DRIVING", 14, 50, 25, false, GetPedheadshotTxdString(RegisterPedheadshot(PlayerPedId())), GetPedheadshotTxdString(RegisterPedheadshot(PlayerPedId())))
			
				EndTextCommandThefeedPostTicker(false, true)
				
				UnregisterPedheadshot(RegisterPedheadshot(PlayerPedId()))

			else

				if CurrentCheckPoint ~= LastCheckPoint then
					if DoesBlipExist(CurrentBlip) then
						RemoveBlip(CurrentBlip)
					end

					CurrentBlip = AddBlipForCoord(eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.x, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.y, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.z)
					SetBlipRoute(CurrentBlip, 1)

					LastCheckPoint = CurrentCheckPoint
				end

				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.x, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.y, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.z, true)

				if distance <= 90.0 then
					DrawMarker(36, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.x, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.y, eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 204, 102, 100, false, true, 2, false, false, false, false)
				end

				if distance <= 3.0 then
					eDAutoEcole.AutoEcole.CheckPoints[nextCheckPoint].Action(PlayerPedId(), SetZoneTypeVille)
					CurrentCheckPoint = CurrentCheckPoint + 1
				end
			end


			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then

				local vehicle      = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				local speed        = GetEntitySpeed(vehicle) * 3.6
				local tooMuchSpeed = false
				local GetSpeed = math.floor(GetEntitySpeed(vehicle) * 3.6)
				local speed_limit_residence = eDAutoEcole.AutoEcole.Infos.Route.Residence
				local speed_limit_ville = eDAutoEcole.AutoEcole.Infos.Route.Ville
				local speed_limit_otoroute = eDAutoEcole.AutoEcole.Infos.Route.Otoroute

				local DamageControl = 0

				if ErrorSpeed == 0 and GetSpeed >= speed_limit_residence then
					tooMuchSpeed 	  = true
					DriveErrors       = DriveErrors + 1
					IsAboveSpeedLimit = true
					ESX.ShowAdvancedNotification('Amanda', '~r~Vous avez fait une erreur~w~', "Vous roulez trop vite, vitesse limite : " ..speed_limit_residence.. " km/h~w~!\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", eDAutoEcole.AutoEcole.Infos.CHAR)
					Wait(2000) -- evite bug
				end

				if ErrorSpeed == 1 and GetSpeed >= speed_limit_ville then
					tooMuchSpeed = true
					DriveErrors       = DriveErrors + 1
					IsAboveSpeedLimit = true
					ESX.ShowAdvancedNotification('Amanda', '~r~Vous avez fait une erreur~w~', "Vous roulez trop vite, vitesse limite : " ..speed_limit_ville.. " km/h~w~!\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", eDAutoEcole.AutoEcole.Infos.CHAR)
					Wait(2000)
				end

				if ErrorSpeed == 2 and GetSpeed >= speed_limit_otoroute then
					tooMuchSpeed = true
					DriveErrors       = DriveErrors + 1
					IsAboveSpeedLimit = true
					ESX.ShowAdvancedNotification('Amanda', '~r~Vous avez fait une erreur~w~', "Vous roulez trop vite, vitesse limite : " ..speed_limit_otoroute.. " km/h~w~!\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", eDAutoEcole.AutoEcole.Infos.CHAR)
					Wait(2000)
				end

				if HasEntityCollidedWithAnything(vehicle) and DamageControl == 0 then
					DriveErrors       = DriveErrors + 1
					ESX.ShowAdvancedNotification(eDAutoEcole.AutoEcole.Infos.NomDuMonitor, '~r~Vous avez fait une erreur~w~', "Votre vehicule c\'est pris des dégats\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", eDAutoEcole.AutoEcole.Infos.CHAR)
					Wait(2000)
				end

				if not tooMuchSpeed then
					IsAboveSpeedLimit = false
				end

				if GetEntityHealth(vehicle) < GetEntityHealth(vehicle) then

					DriveErrors = DriveErrors + 1

					ESX.ShowAdvancedNotification('Amanda', '~r~Vous avez fait une erreur~w~', "Votre vehicule c\'est pris des dégats\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", eDAutoEcole.AutoEcole.Infos.CHAR)
					
					VehicleHealth = GetEntityHealth(vehicle)
					Wait(2000)
				end
				if DriveErrors >= 5 then
					CurrentCheckPoint = 10
					RemoveBlip(CurrentBlip)
					SetNewWaypoint(204.82, 377.133)
					DrawMarker(36, 204.82, 377.133, 107.24, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 204, 102, 100, false, true, 2, false, false, false, false)
					local dist = Vdist2(GetEntityCoords(PlayerPedId()), 204.82, 377.133, 107.24)
					if dist <= 2.5 then
						ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour rendre le véhicule.")
						if IsControlJustPressed(0, 51) then
							StopDriveTest(false)
							DriveErrors = 0
							CurrentCheckPoint = 0
							RemoveBlip(CurrentBlip)
						end
					end
				end
			end
		else 
			Wait(500)
		end
	end
end

function StartDriveTest()
    for k, v in pairs(eDAutoEcole.AutoEcole.DriveTeste.DriveTestVoiture) do
        CurrentTest       = 'drive'
        CurrentTestType   = type
        startedconduite = true
        permisencours = "drive"
        drivetest = "voiture"
    
        RequestModel(GetHashKey(v.Veh))
    
        while not HasModelLoaded(GetHashKey(v.Veh)) do
            Wait(100)
        end
    
        local veh = CreateVehicle(GetHashKey(v.Veh), v.Spawn, v.SpawnHeading, 1, 0)
        TaskEnterVehicle(GetPlayerPed(-1), veh, 20000, -1, 2.0, 3, 0)
    
        ESX.ShowAdvancedNotification(eDAutoEcole.AutoEcole.Infos.NomDuMonitor, '~r~Me voila !~w~', 'Tenez votre voiture, bonne route et bonne chance !', eDAutoEcole.AutoEcole.Infos.CHAR)
    
        StartConduite()
    end
end

function StartDriveTestMoto()
    for k, v in pairs(eDAutoEcole.AutoEcole.DriveTeste.DriveTestMoto) do
        CurrentTest = 'drive'
        startedconduite = true
        permisencours = "bike"
        drivetest = "moto"
    
        RequestModel(GetHashKey(v.Veh))
    
        while not HasModelLoaded(GetHashKey(v.Veh)) do
            Wait(100)
        end
        
        local veh = CreateVehicle(GetHashKey(v.Veh), v.Spawn, v.SpawnHeading, 1, 0)
        TaskEnterVehicle(GetPlayerPed(-1), veh, 20000, -1, 2.0, 3, 0)
    
        ESX.ShowAdvancedNotification(eDAutoEcole.AutoEcole.Infos.NomDuMonitor, '~r~Me voila !~w~', 'Tenez votre moto, bonne route et bonne chance !', eDAutoEcole.AutoEcole.Infos.CHAR)
    
        StartConduite()
    end
end


function StartDriveTestCamion()
    for k, v in pairs(eDAutoEcole.AutoEcole.DriveTeste.DriveTestCamion) do
        CurrentTest = 'drive'
        permisencours = "truck"
        drivetest = "camion"
    
        startedconduite = true
    
        RequestModel(GetHashKey(v.Veh))
    
        while not HasModelLoaded(GetHashKey(v.Veh)) do
            Wait(100)
        end
        
        local veh = CreateVehicle(GetHashKey(v.Veh), v.Spawn, v.SpawnHeading, 1, 0)
        TaskEnterVehicle(GetPlayerPed(-1), veh, 20000, -1, 2.0, 3, 0)
    
        ESX.ShowAdvancedNotification(eDAutoEcole.AutoEcole.Infos.NomDuMonitor, '~r~Me voila !~w~', 'Tenez votre camion, bonne route et bonne chance !', eDAutoEcole.AutoEcole.Infos.CHAR)
    
        StartConduite()
    end
end


RegisterNetEvent("</eDen:StartDriveTestCamion")
AddEventHandler("</eDen:StartDriveTestCamion", function() 
    StartDriveTestCamion()
end)

RegisterNetEvent("</eDen:StartDriveTest")
AddEventHandler("</eDen:StartDriveTest", function() 
    StartDriveTest()
end)

RegisterNetEvent("</eDen:StartDriveTestMoto")
AddEventHandler("</eDen:StartDriveTestMoto", function() 
    StartDriveTestMoto()
end)

function CheckLicenseDmv()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(PermisDmv)
        permisdmv = PermisDmv
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), 'dmv')
end 

function CheckLicensePermisVoiture()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(PermisLicenseVoiture)
        permisvoiture = PermisLicenseVoiture
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), "drive")
end 

function CheckLicensePermisMoto()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(PermisLicenseMoto)
        permismoto = PermisLicenseMoto
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), "drive_bike")
end 

function CheckLicensePermisCamion()
    ESX.TriggerServerCallback('esx_license:checkLicense', function(PermisLicenseCamion)
        permiscamion = PermisLicenseCamion
        Citizen.Wait(5000)
    end, GetPlayerServerId(PlayerId()), "drive_truck")
end 

RegisterNetEvent('</eDen:loadLicenses')
AddEventHandler('</eDen:loadLicenses', function(licenses)
  Licenses = licenses
end)

