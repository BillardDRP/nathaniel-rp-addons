AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_lab/desklamp01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(3)
	self:SetIsTurnedOn(true)
end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		if self:GetIsTurnedOn() then
			caller:ChatPrint("Weed lamp has been turned off")
			self:SetIsTurnedOn(false)
		elseif !self:GetIsTurnedOn() then
			caller:ChatPrint("Weed lamp has been turned on")
			self:SetIsTurnedOn(true)
		end
		DoGenericUseEffect(caller)
	end
end