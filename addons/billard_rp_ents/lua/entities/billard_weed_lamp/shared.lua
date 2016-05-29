ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Weed Lamp"
ENT.Category = "Billard's Drugs"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsTurnedOn")
	self:NetworkVar("Int", 0, "SpamTime")
end

function ENT:Think()
	if self:GetIsTurnedOn() then
		self:EmitSound("ambient/machines/machine3.wav")
	end
end