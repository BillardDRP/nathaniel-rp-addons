ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "BCraft Item Output"
ENT.Author = "Sir Francis Billard"
ENT.Spawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "BCraftOutputClass")
end
