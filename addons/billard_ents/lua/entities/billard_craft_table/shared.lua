ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Crafting Table"
ENT.Category = "Billard"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsBeingUsed")
	self:NetworkVar("Bool", 1, "IsCrafting")
	self:NetworkVar("String", 0, "ItemToCraft")
	self:NetworkVar("Entity", 0, "TableUser")
end
