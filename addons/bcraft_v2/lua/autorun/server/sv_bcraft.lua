BCraft = {}

--Recipe template: 11223344item_class
--Would require 11 wood, 22 springs, 33 wrenches, and 44 gunpowder
--Would give item_class
--The recipe is equal to whether or not it can be crafted

BCraft.RecipeList = {
	["00000400lockpick"] = true,
	["03050202m9k_ak47"] = true,
	["00020101m9k_deagle"] = true,
	["06020402m9k_double_barrel"] = true,
	["00060808npc_turret_floor"] = true,

	["00020800cityrp_kevlar"] = false,
	["00020208cityrp_ammo_dispenser"] = false,
	["10302500prop_vehicle_jeep"] = false,
	["99999999m9k_davy_crockett"] = false,
}

local PlyMeta = FindMetaTable("Player")

function PlyMeta:GetBCraftSupply() --Returns: Player's wood, player's springs, player's wrenches, player's gunpowder
	return tonumber(self:GetPData("bcraft_wood", 0)), tonumber(self:GetPData("bcraft_spring", 0)), tonumber(self:GetPData("bcraft_wrench", 0)), tonumber(self:GetPData("bcraft_gunpowder", 0))
end

BCraft.DecodeRecipe = function(recipe) --Returns: Wood needed, springs needed, wrenches needed, gunpowder needed, entity classname
	return tonumber(string.sub(recipe, 1, 2)), tonumber(string.sub(recipe, 3, 4)), tonumber(string.sub(recipe, 5, 6)), tonumber(string.sub(recipe, 7, 8)), tostring(string.sub(9, string.len(recipe)))
end

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
					local Wood, Springs, Wrenches, Gunpowder, Classname = BCraft.DecodeRecipe(k)
					ply:ChatPrint(Classname.." can be crafted with "..Wood.." wood, "..Springs.." springs, "..Wrenches.." wrenches, and "..Gunpowder.." gunpowder.")
					return
				end
			end
		end
		for k, v in pairs(BCraft.RecipeList) do
			ply:SendLua("print('Found item: '..string.sub(tostring(k), 9, string.len(tostring(k))))")
			if CraftItem == string.sub(tostring(k), 9, string.len(tostring(k))) then
				if !v then return end
				local Wood, Springs, Wrenches, Gunpowder, Classname = BCraft.DecodeRecipe(k)
				local PlyWood, PlySprings, PlyWrenches, PlyGunpowder = ply:GetBCraftSupply()
				if PlyWood >= Wood and PlySprings >= PlySprings and PlyWrenches >= Wrenches then
					ply:SetPData("bcraft_wood", PlyWood - Wood)
					ply:SetPData("bcraft_springs", PlySprings - Springs)
					ply:SetPData("bcraft_wrenches", PlyWrenches - Wrenches)
					ply:SetPData("bcraft_gunpowder", PlyGunpowder - Gunpowder)
					local RecipeOutput = ents.create(string.sub(tostring(k)), 9, string.len(tostring(k)))
					RecipeOutput:SetPos(ply:GetPos())
					RecipeOutput:Spawn()
				end
				break
			end
		end
	end
end)
