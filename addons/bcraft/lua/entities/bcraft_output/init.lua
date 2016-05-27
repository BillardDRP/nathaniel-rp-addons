AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	if not phys:IsValid() then
		self:SetModel("models/weapons/w_rif_ak47.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		phys = self:GetPhysicsObject()
	end
	phys:Wake()
end

function ENT:OnTakeDamage(dmg)
	self:TakePhysicsDamage(dmg)
end

function ENT:Use(activator, caller)
	if !IsValid(caller) or !IsPlayer(caller) then return end
	caller:Give(self:GetBCraftOutputClass())
	self:Remove()
end
