eDAutoEcole = {
    GetESX = "esx:getSharedObject",
    AutoEcole = {
        CodeRoute = {
            ErreurCode = 4,
        },
        Permis = {
            Voiture = {
                {Type = "voiture", Price = 100, Char = "CHAR_MIGUEL_MADROZA"},
            },
            Moto = {
                {Type = "moto", Price = 200, Char = "CHAR_MIGUEL_MADROZA"},
            },
            Camion = {
                {Type = "camion", Price = 300, Char = "CHAR_MIGUEL_MADROZA"},
            },
        },
        DriveTeste = {
            DriveTestVoiture = {
                {Veh = "rhapsody", Spawn = vector3(213.61, 389.34, 106.85), SpawnHeading = 171.44}
            },
            DriveTestMoto = {
                {Veh = "bati", Spawn = vector3(213.61, 389.34, 106.85), SpawnHeading = 171.44}
            },
            DriveTestCamion = {
                {Veh = "mule", Spawn = vector3(213.61, 389.34, 106.85), SpawnHeading = 171.44}
            },
        },
        Infos = {
            NameMenu = "AutoEcole",
            NomDuMonitor = "Mario",
            CHAR = "CHAR_MIGUEL_MADROZA",
            Route = {
                Residence = 50.0,
                Ville = 80.0,
                OToroute = 120.0
            },
            Marcker = {
                PositionAutoEcole = {
                    {pos = vector3(228.60659790039, 374.45275878906, 106.09814453125)},
                },
            },
            Blips = {
                {
                    Sprite = 408,
                    Scale = 0.60,
                    Colour = 20,
                    Name = "Auto-Ecole",
                    Position = vector3(228.60659790039, 374.45275878906, 106.09814453125)
                }
            },
        },
        CheckPoints = {
            {
                Pos = {x = 216.204, y = 370.29, z = 106.323},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Allons sur la route, tournez à gauche, vitesse limitée à~w~ ~y~80km/h", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 236.32, y = 346.78, z = 105.57},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 403.16, y = 300.05, z = 103.00},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attentions au feu", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 548.00, y = 247.555, z = 103.09},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attentions au feu", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 658.73, y = 213.41, z = 95.93},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Tournez !~w~', "Tournez à droite, n'oubliez pas vos clignotants", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 670.106, y = 194.68, z = 93.19},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Zone résidentielle !~w~', "Vous entrez dans une zone résidentielle, limite ~y~50km/h", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 0
                end
            },
        
            {
                Pos = {x = 625.11, y = 69.87, z = 90.11},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Tournez~w~', "Prenez à droite, vitesse limite ~y~80km/h", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 534.88, y = 75.044, z = 96.37},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Tournez à gauche quand le feu est vert", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 484.05, y = 39.68, z = 92.18},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Allez vers le prochain passage", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },	
        
            {
                Pos = {x = 401.702, y = -108.51, z = 65.19}, 
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Laissez passer le pieton.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                    pieton = true
                end
            },
            {
                Pos = {x = 358.86, y = -245.34, z = 53.97},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
            {
                Pos = {x = 317.28, y = -362.89, z = 45.25},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
            {
                Pos = {x = 294.85, y = -456.19, z = 43.28},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Tournez à droite, vitesse limitée à~y~ 120km/h.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
            {
                Pos = {x = 68.52, y = -479.70, z = 34.06},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
            {
                Pos = {x = -138.31, y = -494.899, z = 29.42},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
            {
                Pos = {x = -688.59, y = -497.28, z = 25.19},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
            {
                Pos = {x = -989.10, y = -546.41, z = 18.35},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Ralentissez.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
            {
                Pos = {x = -1157.47, y = -638.79, z = 22.72},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Tournez à gauche vitesse limite ~y~80km/h.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
            {
                Pos = {x = -1142.446, y = -691.37, z = 21.63},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Tournez à gauche, attention au feu.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },

            {
                Pos = {x = -1016.85, y = -616.55, z = 18.26},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit, vitesse limite ~y~120km/h.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
        
            {
                Pos = {x = -849.54, y = -541.89, z = 22.83},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
        
            {
                Pos = {x = -490.50, y = -530.48, z = 25.33},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
        
            {
                Pos = {x = -26.30, y = -527.42, z = 33.25},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit, préparez vous à tournez à droite et ralentissez.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 2
                end
            },
        
            {
                Pos = {x = 91.53, y = -544.01, z = 33.84},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit, vitesse limitée à ~y~80km/h.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 252.99, y = -543.60, z = 43.21},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Tournez à gauche, attention au feu.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 306.79, y = -459.09, z = 43.32},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 318.32, y = -410.10, z = 45.12},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 351.15, y = -293.01, z = 53.88},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 400.48, y = -149.67, z = 64.69},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
            
            {
                Pos = {x = 508.28, y = 56.62, z = 95.80},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
            
            {
                Pos = {x = 563.84, y = 228.76, z = 103.04},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, tournez à gauche.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 437.77, y = 293.12, z = 102.99},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 275.69, y = 337.76, z = 105.51},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 223.73, y = 356.74, z = 105.85},
                Action = function(playerPed)
                    ESX.ShowAdvancedNotification('Mario', 'Bien~w~', "Tournez à droite.", 'CHAR_MIGUEL_MADROZA')
                    ErrorSpeed = 1
                end
            },
        
            {
                Pos = {x = 213.72, y = 389.25, z = 106.84},
                Action = function(playerPed)
                    startedconduite = false
                    if DriveErrors < 5 then
                        StopDriveTest(true)
                    else
                        StopDriveTest(false)
                    end
                end
            },
        }
    }
}
