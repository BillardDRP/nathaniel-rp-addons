AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("bcraft_config.lua")

function ENT:Initialize()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetModel("models/props_combine/breen_desk.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
end

function ENT:OnTakeDamage(dmg)
	self:TakePhysicsDamage(dmg)
end

function ENT:Use(activator, caller)
	if !IsValid(caller) or !IsPlayer(caller) then return end
	if self:GetBeingUsed() then
		caller:ChatPrint("This crafting station is already in use!")
	else
	self:SetBeingUsed(true)
	
	self:SetBeingUsed(false)
	end
end
