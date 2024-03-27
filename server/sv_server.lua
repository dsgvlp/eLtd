RegisterServerEvent('earkyn:payement')
AddEventHandler('earkyn:payement', function(nameitem, quantity, paymentType)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayerCash = xPlayer.getAccount(ConfigMoney.cash).money
    local xPlayerBank = xPlayer.getAccount(ConfigMoney.bank).money
    local playerName = GetPlayerName(_source)
    local triggerName = 'earkyn:payement'
    local banReason = 'Tentative de triche utilisation Trigger: ' ..triggerName
    
    if xPlayer and xPlayer.source == _source then
        local product = ShopsProduct[nameitem]
        
        if product then
            local price = product.price * quantity
            
            if paymentType == 1 then
                if xPlayerCash >= price then
                    xPlayer.removeAccountMoney(xPlayerCash, price)
                    xPlayer.addInventoryItem(product.name, quantity)
                    xPlayer.showNotification("~o~Apu~s~\nPrix : ~g~"..price.."$~s~\nPaiement : ~o~Cash")
                else
                    xPlayer.showNotification('Fonds insuffisants !')
                end
            elseif paymentType == 2 then
                if xPlayerBank >= price then
                    xPlayer.removeAccountMoney(xPlayerBank, price)
                    xPlayer.addInventoryItem(product.name, quantity)
                    xPlayer.showNotification("~o~Apu~s~\nPrix : ~g~"..price.."$~s~\nPaiement : ~o~Bank")
                else
                    xPlayer.showNotification('Fonds insuffisants !')
                end
            end
        end
    end

    if playerName ~= nil and playerName ~= '' then
        BanPlayer(_source, banReason)
    end
    
end)