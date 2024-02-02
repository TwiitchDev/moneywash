-------------------------------------
---------- Biggesttom#9962 ----------
-------------------------------------

Config = {}
Config.Core = 'QBCore' -- The name of your core. Default; QBCore
Config.CoreFolder = 'qb-core' -- The name of your core folder. Default; qb-core
Config.TargetName = 'qb-target' -- The name of your third eye targeting. Default; qb-target
Config.MenuName = 'qb-menu' -- The name of your menu. Default; qb-menu
Config.ItemCheckEvent = 'QBCore:HasItem' -- The name of your item check event. Default; 'QBCore:HasItem'
Config.RemoveItemEvent = 'QBCore:Server:RemoveItem' -- The name of your item check event. Default; 'QBCore:Server:AddItem'
Config.AddItemEvent = 'QBCore:Server:AddItem' -- The name of your item check event. Default; 'QBCore:Server:AddItem'
Config.StressEvent = 'hud:server:RelieveStress' -- Event to remove stress from player. Default; 'hud:server:RelieveStress'

Config.BlackMarketItems = {
    [1] = { name = "markedbills",                 price = 2000,   amount = 1000, info = {}, type = "item", slot = 1 },
}

Config.MoneyType = 'cash' -- Money type to receive payment; 'cash' 'bank' 'crypto'
Config.WashMoney = { -- Sale prices match these too the above
    ['markedbills'] = 2000,
}

Config.Lang = {
	-- General notifications & prog bar
    ['drugstorelabel'] = 'Black Market', -- Shop Header
    ['washedMoney'] = 'You successfully washed all your marked money', -- Notification
    ['noMarkedbills'] = 'You dont have any dirty money to wash. Dumbass!', -- Notification
}