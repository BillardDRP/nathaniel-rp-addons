BCraft.RecipeList = {
	["000002lockpick"] = true,
	["020301m9k_ak47"] = true,
}

hook.Add("PlayerSay", "BCraft_CraftCommand", function(ply, text, team)
	if !IsValid(ply) or !IsPlayer(ply) then return end
	if string.sub(text, 1, 6) == "/craft" or string.sub(text, 1, 6) == "!craft" then
		if string.len(text) < 8 then
			ply:ChatPrint("Please specify what you would like to craft, or specify 'list' for a list of craftable items.")
			return
		end
		local CraftItem = string.sub(text, 8, string.len(text))
		if CraftItem == "list" then
			for k, v in pairs(BCraft.RecipeList) do
				if v then
					local Wood, Springs, Wrenches, Classname = BCraft.DecodeRecipe(k)
					ply:ChatPrint(Classname.." can be crafted with "..Wood.." wood, "..Springs.." springs, and "..Wrenches.." wrenches.")
					return
				end
			end
		end
		for k, v in pairs(BCraft.RecipeList) do
			if CraftItem == k then
				if !v then return end
				local Wood, Springs, Wrenches, Classname = BCraft.DecodeRecipe(k)
				local PlyWood, PlySprings, PlyWrenches = ply:GetBCraftSupply()
				if PlyWood >= Wood and PlySprings >= PlySprings and PlyWrenches >= Wrenches then
					
				end
			end
		end
	end
end)
