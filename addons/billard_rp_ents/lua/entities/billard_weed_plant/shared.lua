ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Weed Plant"
ENT.Category = "Billard's Drugs"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsFinishedGrowing")
	self:NetworkVar("Int", 0, "SpamTime")
	self:NetworkVar("Int", 1, "Growth")
end