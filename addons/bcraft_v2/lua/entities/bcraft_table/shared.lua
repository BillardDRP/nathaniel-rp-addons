ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Crafting Station"
ENT.Author = "Sir Francis Billard"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "BCraftOutputClass")
end
