ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "First Aid Kit"
ENT.Category = "Billard's Other"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "SpamTime")
end