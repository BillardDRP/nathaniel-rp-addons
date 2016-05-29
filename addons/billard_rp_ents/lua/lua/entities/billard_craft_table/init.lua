AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_combine/breendesk.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetIsBeingUsed(false)
	self:SetIsCrafting(false)
	self:SetItemToCraft("")
end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		if !self:GetOwner() then
			self:SetOwner(caller)
		end
		umsg.Start("BillardCraftTableOpenMenu", caller)
		umsg.End()
		self:SetTableUser(caller)
		DoGenericUseEffect(caller)
	end
end