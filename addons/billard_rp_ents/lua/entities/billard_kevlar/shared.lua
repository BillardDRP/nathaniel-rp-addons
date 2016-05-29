ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Kevlar"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "SpamTime")
end