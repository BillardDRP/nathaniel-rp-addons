AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_lab/cactus.mdl") //Because who needs custom models, amirite?
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(3)
	self:SetGrowth(0)
	self:SetIsFinishedGrowing(false)
end

function ENT:Think()
	if !self:GetIsFinishedGrowing then
		for k, v in pairs(ents.FindInSphere(self:GetPos(), 300)) do
			if v:GetClass() == "billard_weed_lamp" then
				self:SetGrowth(self:GetGrowth() + 1)
				self:NextThink(CurTime() + 1)
			end
		end
	end
	return true
end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		if !self:GetOwner() then
			caller:ChatPrint("You have claimed this weed pot")
			self:SetOwner(caller)
		end
		if self:GetIsFinishedGrowing() then
			local baggie = ents.Create("billard_weed_harvested")
			baggie:SetPos(self:GetPos() + Vector(0, 50, 0))
			baggie:Spawn()
			self:SetGrowth(0)
			self:SetIsFinishedGrowing(false)
		else
			caller:ChatPrint("Weed pot is "..self:GetGrowth.." percent grown")
			self:SetSpamTime(CurTime() + 0.5)
		end
		DoGenericUseEffect(caller)
	end
end