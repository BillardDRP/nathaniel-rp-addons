ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Drug Market"
ENT.Category = "Billard's Drugs"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "SpamTime")
	self:NetworkVar("Int", 1, "MethPrice")
	self:NetworkVar("Int", 2, "CokePrice")
	self:NetworkVar("Int", 3, "WeedPrice")
	self:NetworkVar("Int", 4, "HeroinPrice")
end