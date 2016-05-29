AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_c17/SuitCase_Passenger_Physics.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetSpamTime(CurTime() + 0.5)
end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		if caller:Armor >= 100 then
			if self:GetSpamTime() <= CurTime() then
				caller:ChatPrint("You are already wearing kevlar!")
				self:SetSpamTime(CurTime() + 0.5)
			end
			return
		end
		caller:SetArmor(100)
		self:EmitSound("items/ammopickup.wav")
		DoGenericUseEffect(caller)
		self:Remove()
	end
end