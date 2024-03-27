Citizen.CreateThread(function()
    Wait(1500)
    for k, v in pairs(ShopsDetail) do 

        Horizon:AddNewPed(k, v.position, v.heading, "mp_m_shopkeep_01", "WORLD_HUMAN_CLIPBOARD", "Mohamed Sumbul", nil, function(...)OpenShopsMenu(...)end, {
        })

    --  print(v.name, v.position, v.sprite, v.color)
        Horizon:AddNewBlips("ltd"..k, v.name, v.position, v.sprite, v.color)
    end
end)

local cashAmount = ""
local bankAmount = ""

for i = 1, #ESX.PlayerData.accounts, 1 do
    if ESX.PlayerData.accounts[i].name == ConfigMoney.cash then
        cashAmount = ESX.PlayerData.accounts[i].money.."~g~$~s~"
    elseif ESX.PlayerData.accounts[i].name == ConfigMoney.bank then
        bankAmount = ESX.PlayerData.accounts[i].money.."~b~$~s~"
    end
end

OpenShopsMenu = function()

    local mainshops = RageUI.CreateMenu("LTD", "Supérette")
    local mainpayement = RageUI.CreateSubMenu(mainshops, "LTD", "Panier")


    RageUI.Visible(mainshops, not RageUI.Visible(mainshops))

    while mainshops do
        Wait(1)

        RageUI.IsVisible(mainshops, function()

            RageUI.Info("~o~HORIZON LTD", {"Argent ~g~Liquide~s~ : ", "Argent ~b~Banque~s~ : "}, {cashAmount, bankAmount})

            RageUI.Separator("↓ Produits Disponibles ↓")
            for k, v in pairs (ShopsProduct) do
                RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, (v.vip == 0 and true or v.vip ~= 0 and Config.TriggerVIP == 0 and false or v.vip~= 0 and Config.TriggerVIP ~= 0 and true ), {
                    onSelected = function()
                        ItemSelected = v
                    end
                }, mainpayement)
            end

        end, function()
        end)

        RageUI.IsVisible(mainpayement, function()
            ESX.PlayerData = ESX.GetPlayerData()

            if ItemSelected then 
                RageUI.Separator("Nom: "..ItemSelected.label)

                RageUI.Info("~o~HORIZON LTD", {"Argent ~g~Liquide~s~ : ", "Argent ~b~Banque~s~ : "}, {cashAmount, bankAmount})
    
                RageUI.Separator("↓ Passer au payement ↓")
    
                RageUI.Button("Définissez la quantité", nil, {RightLabel = ("%s"):format(quantitybuy)}, true, {
                    onSelected = function()
                        quantity = Horizon.Functions.KeyBoardInput("Quantite a acheter", "", 20)
    
                        if tonumber(quantity) then
                            quantitybuy = tonumber(quantity)
                        else
                            TriggerClientEvent("esx:showNotification", source, "[~r~ERROR~s~]\nVeuillez mettre des chiffres !")
                        end
                    end
                })
    
                RageUI.Button('Payer en Liquide', nil, {}, true, {
                    onSelected = function()
                        RageUI.GoBack()
                        TriggerServerEvent('earkyn:payement', ItemSelected.name, quantitybuy, 1)
                    end
                })
                RageUI.Button('Payer par Carte Bancaire', nil, {}, true, {
                    onSelected = function()
                        RageUI.GoBack()
                        TriggerServerEvent('earkyn:payement', ItemSelected.name, quantitybuy, 2)
                    end
                })
            end
            

        end, function()
        end)

        if not RageUI.Visible(mainshops) and
        not RageUI.Visible(mainpayement) then
            mainshops = RMenu:DeleteType("mainshops")
            mainpayement = RMenu:DeleteType("mainpayement")
        end
    end

end



