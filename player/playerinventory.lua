-- luacheck: ignore ItemID TweakDBID Player Game
local PlayerInventory = {}

-- There is no way to tell if this is sucessful or not.
function PlayerInventory.CreateItemID(itemStr)
    return ItemID.new(TweakDBID.new(itemStr))
end

function PlayerInventory.GetCount(itemStr)
    return Game.GetTransactionSystem():GetItemQuantity(Player.GetPlayer(), PlayerInventory.CreateItemDB(itemStr))
end

function PlayerInventory.AddToInv(itemStr, quantity)
    if not itemStr or itemStr == "" then
        print("PlayerInventory.AddToInv():", "You must speicfy an item")
        return
    end

    if quantity == 0 then
        print("PlayerInventory.AddToInv():", "quantity was 0")
        print("Not adding anything to inventory")
        return

    end
    Game.AddToIventory(PlayerInventory.CreateItemID(itemStr),
        not quantity and 1 or quantity < 0 and 1 or quantity)
end

return PlayerInventory
