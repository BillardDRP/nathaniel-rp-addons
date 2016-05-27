AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("bcraft_config.lua")

local meta = FindMetaTable("Player")

local function meta:GetBCraftSupply() --Returns: Player's wood, player's springs, player's wrenches
	return tonumber(self:GetPData("bcraft_wood", 0)), tonumber(self:GetPData("bcraft_spring", 0)), tonumber(self:GetPData("bcraft_wrench", 0))
end

local function DecodeRecipeString(recipe) --Returns: Wood needed, springs needed, wrenches needed, entity classname
	return tonumber(string.sub(recipe, 1, 2)), tonumber(string.sub(recipe, 3, 4)), tonumber(string.sub(recipe, 5, 6)), tostring(string.sub(7, string.len(recipe)))
end

function ENT:Initialize()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetModel("models/props_combine/breen_desk.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self:SetSpamTime(CurTime() + 0.5)
end

function ENT:OnTakeDamage(dmg)
	self:TakePhysicsDamage(dmg)
end

function ENT:CraftItem(classname, model)
	if self:GetIsCrafting() then return end
	timer.Simple(10, function()
		local CraftOutput = ents.Create("bcraft_output")
		CraftOutput:SetOutputClass(classname)
		CraftOutput:SetModel(model)
		CraftOutput:SetPos(self:GetPos() + Vector(0, 75, 0))
		CraftOutput:Spawn()
	end)
end

function ENT:Use(activator, caller)
	if !IsValid(caller) or !IsPlayer(caller) then return end
	--if self:GetBeingUsed() then
		--caller:ChatPrint("This crafting station is already in use!")
	--else
	--self:SetBeingUsed(true)
	if self:GetIsCrafting() then
		caller:ChatPrint("This crafting station is currently crafting an item.")
		return
	end
	local PlyWood, PlySpring, PlyWrench = caller:GetBCraftSupply() --Ayy multi-return
	caller:ChatPrint("You currently have "..PlyWood.." wood, "..PlySpring.." springs, and "..PlyWrench.." wrenches.")
	--self:SetBeingUsed(false)
	end
end
