ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bomb"
ENT.Category = "Billard"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsActive")
	self:NetworkVar("Int", 0, "BombTime")
end