-------------------------------------
---------- Biggesttom#9962 ----------
-------------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.Core
local CoreFolder = Config.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.TargetName
local MenuName = Config.MenuName
local ItemCheckEvent = Config.ItemCheckEvent
local RemoveItemEvent = Config.RemoveItemEvent
local AddItemEvent = Config.AddItemEvent
local spawnedCocaine = 0
local cocainePlants = {}
local isPickingUp = false
local isProcessing = false
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- STOP MENU CODE START --<!>--
-- Event to clear player tasks on menu close
RegisterNetEvent('BPRP-moneywash:client:StopMenu', function()
    ClearPedTasks(PlayerPedId())
end)
--<!>-- STOP MENU CODE END --<!>--

--<!>-- NOTIFICATIONS CODE START --<!>--
RegisterNetEvent('BPRP-moneywash:notifications')
AddEventHandler('BPRP-moneywash:notifications', function(msg, type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS CODE END --<!>--

--<!>-- PED CODE START --<!>--
local SalesPed = {
    {1132.2, -988.61, 45.11,"joe",197.84,0xBE204C9B,"ig_joeminuteman"}, -- Coke processing ped and location
}

Citizen.CreateThread(function()
    for _,v in pairs(SalesPed) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        SalesPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(SalesPed, v[5])
        FreezeEntityPosition(SalesPed, true)
        SetEntityInvincible(SalesPed, true)
        SetBlockingOfNonTemporaryEvents(SalesPed, true)
        TaskStartScenarioInPlace(SalesPed, "WORLD_HUMAN_SMOKING_POT", 0, true) 
    end
end)
exports[TargetName]:AddTargetModel(`ig_joeminuteman`, {
    options = {
        {
            event = 'BPRP-moneywash:client:OpenDrugShopMenu',
            icon = 'fab fa-drupal',
            label = 'Speak to Joe',
        },
    },
distance = 2.0 
})
RegisterNetEvent('BPRP-moneywash:client:OpenDrugShopMenu', function()
    exports[MenuName]:openMenu({
        {
            header = "Joe",
            txt = "I'm here for all your marked money needs.",
            isMenuHeader = true
        },
        {
            header = "Wash Money",
            txt = "Wash of all your marked money.",
            params = {
                event = "BPRP-moneywash:server:WashMoney",
                isServer = true,
                args = 1
            }
        },
        {
            header = "< Exit",
            params = {
                event = "BPRP-moneywash:client:StopMenu"
            }
        },
    })
end)
RegisterNetEvent('BPRP-moneywash:client:OpenDrugShop')
AddEventHandler('BPRP-moneywash:client:OpenDrugShop', function()
    local ShopItems = {}
    ShopItems.label = Config.Lang['drugstorelabel']
    ShopItems.items = Config.BlackMarketItems
    ShopItems.slots = #Config.BlackMarketItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "ckshop", ShopItems)
end)
--<!>-- PED CODE END --<!>-- 
