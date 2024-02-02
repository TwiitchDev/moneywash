-------------------------------------
---------- Biggesttom#9962 ----------
-------------------------------------

local Core = Config.Core
local CoreFolder = Config.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.TargetName
local AddItemEvent = Config.AddItemEvent
local RemoveItemEvent = Config.RemoveItemEvent
local ItemCheckEvent = Config.ItemCheckEvent
local MenuName = Config.MenuName
local MoneyType = Config.MoneyType

--<!>-- WASH MONEY CODE START --<!>--
RegisterServerEvent('BPRP-moneywash:server:WashMoney', function(args) 
	local source = source
    local Player = Core.Functions.GetPlayer(source)
	local args = tonumber(args)
	if args == 1 then 
		if Player.Functions.GetItemByName('markedbills') ~= nil then
            item = Player.Functions.GetItemByName('markedbills').amount
            pay = (item * Config.WashMoney['markedbills'])
            Player.Functions.RemoveItem('markedbills', item)
            Player.Functions.AddMoney(MoneyType, pay)	
			TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['markedbills'], 'remove', item)
            TriggerEvent('BPRP-moneywash:notifications', source, Config.Lang['washedMoney'], 'success') 
            TriggerClientEvent('BPRP-moneywash:client:OpenDrugShopMenu', source)
		else
		    TriggerClientEvent('BPRP-moneywash:notifications', source, Config.Lang['noMarkedbills'], 'error')
            TriggerClientEvent('BPRP-moneywash:client:OpenDrugShopMenu', source)
		end
    end
end)