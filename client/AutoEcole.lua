OpenMenuAutoEcole = function()
    local main = RageUI.CreateMenu(("Menu %s"):format(eDAutoEcole.AutoEcole.Infos.NameMenu), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local code = RageUI.CreateSubMenu(main,("Menu Code "), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local startcode = RageUI.CreateSubMenu(code,("Question 1"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question2 = RageUI.CreateSubMenu(startcode,("Question 2"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question3 = RageUI.CreateSubMenu(question2,("Question 3"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question4 = RageUI.CreateSubMenu(question3,("Question 4"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question5 = RageUI.CreateSubMenu(question4,("Question 5"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question6 = RageUI.CreateSubMenu(question5,("Question 6"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question7 = RageUI.CreateSubMenu(question6,("Question 7"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question8 = RageUI.CreateSubMenu(question7,("Question 8"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question9 = RageUI.CreateSubMenu(question8,("Question 9"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local question10 = RageUI.CreateSubMenu(question9,("Question 10"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    local finiteste = RageUI.CreateSubMenu(question10,("Code Route"), "Shop "..eDAutoEcole.AutoEcole.Infos.NameMenu);
    startcode.Closable = false
    question2.Closable = false
    question3.Closable = false
    question4.Closable = false
    question5.Closable = false
    question6.Closable = false
    question7.Closable = false
    question8.Closable = false
    question9.Closable = false
    question10.Closable = false
    finiteste.Closable = false
    RageUI.Visible(main, not RageUI.Visible(main))
    CheckLicenseDmv()
    CheckLicensePermisVoiture()
    CheckLicensePermisMoto()
    CheckLicensePermisCamion()
    while main do
        Citizen.Wait(0)
        RageUI.IsVisible(main, function()
            if not permisdmv  then
                RageUI.Button("Passer le code de la route", nil, {RightLabel = "→"}, true,{
                    onSelected = function()
                    end
                },code) 
            end
            if permisdmv then
                for k, v in pairs(eDAutoEcole.AutoEcole.Permis.Voiture) do
                    if not permisvoiture then
                    RageUI.Button("Voiture", nil, {RightLabel = ("~g~ %s$"):format(v.Price)}, true,{
                        onSelected = function()
                            RageUI.CloseAll()
                            TriggerServerEvent("</eDen:Achat", v.Type, v.Name, v.Price, v.Char)
                        end
                    }) 
                else
                    RageUI.Button("Voiture", nil, {RightLabel = ("~g~ %s$"):format(v.Price)}, false,{
                        onSelected = function()
                        end
                    }) 
                end
            end
            for k, v in pairs(eDAutoEcole.AutoEcole.Permis.Moto) do
                if not permismoto then
                RageUI.Button("Moto", nil, {RightLabel = ("~g~ %s$"):format(v.Price)}, true,{
                    onSelected = function()
                        RageUI.CloseAll()
                        TriggerServerEvent("</eDen:Achat", v.Type, v.Name, v.Price, v.Char)
                    end
                }) 
            else
                RageUI.Button("Moto", nil, {RightLabel = ("~g~ %s$"):format(v.Price)}, false,{
                    onSelected = function()
                    end
                }) 
            end
        end
        for k, v in pairs(eDAutoEcole.AutoEcole.Permis.Camion) do
            if not permiscamion then
            RageUI.Button("Camion", nil, {RightLabel = ("~g~ %s$"):format(v.Price)}, true,{
                onSelected = function()
                    RageUI.CloseAll()
                    TriggerServerEvent("</eDen:Achat", v.Type, v.Name, v.Price, v.Char)
                end
            }) 
        else
            RageUI.Button("Camion", nil, {RightLabel = ("~g~ %s$"):format(v.Price)}, false,{
                onSelected = function()
                end
            }) 
        end
    end
end
end) 
    RageUI.IsVisible(code,function()

        RageUI.Separator("Bienvenue a l'auto-ecole")
        RageUI.Separator("Bonne Chance a vous.")

        RageUI.Button("Start", nil, {RightLabel = "→"}, true,{
            onSelected = function()
                ErreorTeste = 0
            end
        },startcode)
    end)
    RageUI.IsVisible(startcode,function()

        RageUI.Separator("↓ ~b~Question~s~ ↓")

        RageUI.Button("Si vous conduisez à 50km/h, que vous approchez d'un", nil, {}, true,{})
        RageUI.Button("lieu de résidence cela veut dire que :", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Vous devez accélérer", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question2)

        RageUI.Button("Vous devez faire des drifts", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question2)

        RageUI.Button("Vous devez ralentir", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question2)

        RageUI.Button("Vous pouvez garder votre vitesse", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question2)
    end)
    RageUI.IsVisible(question2,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")

        RageUI.Button("Vous êtes en Centre-ville derrière un véhicule qui roule", nil, {}, true,{})
        RageUI.Button("à 50km/h. Que faites-vous ? :", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Vous le doubler en faisant attention aux véhicules", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question3)

        RageUI.Button("Vous Klaxonner et vous faite un doigt d'honneur", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question3)

        RageUI.Button("Vous attendez derrière le véhicule et rouler à son rythme", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question3)

        RageUI.Button("Vous foncez dans le véhicule tout en l'insultant", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question3)
    end)
    RageUI.IsVisible(question3,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")

        RageUI.Button("Sans aucune indication :", nil, {}, true,{})
        RageUI.Button("La vitesse dans une zone résidentielle est de : __ km/h", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("30 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question4)

        RageUI.Button("40 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question4)

        RageUI.Button("50 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question4)

        RageUI.Button("110 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question4)
    end)
    RageUI.IsVisible(question4,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")

        RageUI.Button("Avant chaque changement de file vous devez :", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Vérifiez votre portière", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question5)

        RageUI.Button("Vérifiez vos angles morts", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question5)

        RageUI.Button("Freiner très rapidement", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question5)

        RageUI.Button("Klaxonner pour prévenir mon changement de file", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question5)
    end)
    RageUI.IsVisible(question5,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")
        RageUI.Button("Quel taux d'alcoolémie est classé comme", nil, {}, true,{})
        RageUI.Button("étant en état d'ébriété ?", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("0.05%", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question6)

        RageUI.Button("0.06%", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question6)

        RageUI.Button("0.08%", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question6)

        RageUI.Button("0.16%", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question6)
    end)
    RageUI.IsVisible(question6,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")
        RageUI.Button("A quel moment vous pouvez passer aux feux ?", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Quand il est orange", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question7)

        RageUI.Button("Quand il n'y a personne sur l'intersection", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question7)

        RageUI.Button("Quand il est rouge", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question7)

        RageUI.Button("Quand il est vert et/ou rouge et que je tourne à droite", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question7)
    end)
    RageUI.IsVisible(question7,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")
        RageUI.Button("Un piéton est au feu rouge pour les piétons", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Vous le laissez passer", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question8)

        RageUI.Button("Vous le dévisager salement", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question8)

        RageUI.Button("Vous lui tirer dessus", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question8)

        RageUI.Button("Vous continuez votre chemin car votre feu est vert", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question8)
    end)
    RageUI.IsVisible(question8,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")
        RageUI.Button("Que devez-vous faire quand vous souhaitez", nil, {}, true,{})
        RageUI.Button("doubler un véhicule ?", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Klaxonner pour le prévenir de mon dépassement", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },question9)

        RageUI.Button("Lui tirer dessus pour que je puisse le dépasser", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question9)

        RageUI.Button("Mettre mon clignotant pour annoncer mon dépassement", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, question9)

        RageUI.Button("Mettre un gros coup d'accelerateur pour le dépasser", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question9)
    end)
    RageUI.IsVisible(question9,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")
        RageUI.Button("Vous conduisez sur une rocade qui indique une vitesse", nil, {}, true,{})
        RageUI.Button("maximum de 110 km/h. La plupart du traffic roule à 130", nil, {}, true,{})
        RageUI.Button("km/h, alors vous ne devriez pas conduire plus vite que :", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("110 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        },question10)

        RageUI.Button("120 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question10)

        RageUI.Button("130 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question10)

        RageUI.Button("140 km/h", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, question10)
    end)
    RageUI.IsVisible(question10,function()
        RageUI.Separator("↓ ~b~Question~s~ ↓")
        RageUI.Button("Quand vous êtes dépassé par un autre véhicule", nil, {}, true,{})
        RageUI.Button("il est important de ne PAS :", nil, {}, true,{})

        RageUI.Separator("↓ ~b~Réponse~s~ ↓")

        RageUI.Button("Lui tirer dessus", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        },finiteste)

        RageUI.Button("Ouvrir ma portière", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, finiteste)

        RageUI.Button("Mettre un gros coup de tête", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
                ErreorTeste = ErreorTeste + 1
            end
        }, finiteste)

        RageUI.Button("Tout cela", "Appuyer sur [~b~ENTRER~s~] pour continue.", {}, true, { 
            onSelected = function()
            end
        }, finiteste)
    end)
    RageUI.IsVisible(finiteste,function()
        if ErreorTeste > eDAutoEcole.AutoEcole.CodeRoute.ErreurCode then
            RageUI.Separator("~r~Dommage tu n’as pas euh le code~s~")
            RageUI.Button("Retour au menu", nil, {RightLabel = "→"}, true,{
                onSelected = function()
                    RageUI.Visible(main, true)
                end
            })
        else
            RageUI.Separator("~g~Bien joue vous avez euh le code.")

            RageUI.Button("Signer et continuez", nil, {RightLabel = "→"}, true,{
                onSelected = function()
                    TriggerServerEvent('</eDen:addLicense', 'dmv')
                    CheckLicenseDmv()
                    CheckLicensePermisVoiture()
                    CheckLicensePermisMoto()
                    CheckLicensePermisCamion()
                    RageUI.CloseAll()
                end
            })
        end 
    end)
        if not RageUI.Visible(main) and not RageUI.Visible(code) and not RageUI.Visible(startcode) and not RageUI.Visible(question2) and not RageUI.Visible(question3) and not RageUI.Visible(question4) and not RageUI.Visible(finiteste) and not RageUI.Visible(question5) and not RageUI.Visible(question6) and not RageUI.Visible(question7) and not RageUI.Visible(question8) and not RageUI.Visible(question9) and not RageUI.Visible(question10) then main = RMenu:DeleteType('main', true) code = RMenu:DeleteType("code", true) startcode = RMenu:DeleteType("startcode", true) question2 = RMenu:DeleteType("question2", true) question3 = RMenu:DeleteType("question3", true) question4 = RMenu:DeleteType("question4", true) finiteste = RMenu:DeleteType("finiteste", true) question5 = RMenu:DeleteType("question5", true) question6 = RMenu:DeleteType("question6", true) question7 = RMenu:DeleteType("question7", true) question8 = RMenu:DeleteType("question8", true) question9 = RMenu:DeleteType("question9", true) question10 = RMenu:DeleteType("question10", true) end
    end
end




RegisterCommand("auto", function()
    OpenMenuAutoEcole()
end)


