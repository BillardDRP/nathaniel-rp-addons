AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_lab/reciever01a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetSpamTime(CurTime() + 0.5)
end

function ENT:Use(activator,caller)
	if IsValid(caller) and caller:IsPlayer() then
		if self:GetSpamTime() <= CurTime() then
			if caller:Health() > caller:GetMaxHealth() - 5 then
				caller:SetHealth(caller:GetMaxHealth)
			else
				caller:SetHealth(caller:Health() + 5)
			end
			self:EmitSound("items/medshot4.wav")
			DoGenericUseEffect(caller)
			self:SetSpamTime(CurTime() + 0.5)
		end
	end
end