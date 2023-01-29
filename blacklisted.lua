sent = false

EX = {}
EX.BlacklistedVehicles = {
    ['rhino'] = {label = 'Tank'},
    ['bmx'] = {label = "Bmx"}
}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- add_ace group.owner EXblacklisted.cars allow

AddEventHandler('entityCreating', function(entity)
    for k, v in pairs(EX.BlacklistedVehicles) do
        local src = NetworkGetEntityOwner(entity)
        local model = GetEntityModel(entity)
        local vehicle = GetHashKey(k)
        if model == vehicle and not IsPlayerAceAllowed(src, "aEXblacklisted.cars") then
            reason = "blacklisted Car: " ..v.label.. " "
            if not sent then
	local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(reason)
        end
            CancelEvent()
    end
end
end)
