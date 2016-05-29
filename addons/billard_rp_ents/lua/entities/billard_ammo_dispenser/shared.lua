ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ammo Dispenser"
ENT.Category = "Billard's Other"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "SpamTime")
end