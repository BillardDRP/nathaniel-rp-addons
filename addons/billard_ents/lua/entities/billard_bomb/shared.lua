ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bomb"
ENT.Category = "Billard"

ENT.Spawnable = true

local BombExplodeSound = "weapons/awp/awp1.wav"
local BompBeepSound = "weapons/c4/c4_beep1.wav"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsActive")
	self:NetworkVar("Int", 0, "BombTime")
end

function ENT:Think()
	if self:GetIsActive() and not (self:GetBombTime() < 1) then
		self:SetBombTime(self:GetBombTime() - 1)
		self:NextThink(CurTime() + 1)
		self:EmitSound("weapons/c4/c4_beep1.wav")
	elseif self:GetIsActive() and (self:GetBombTime() < 1) then
		timer.Simple(1, function()
		local defusedata = EffectData()
		defusedata:SetOrigin(self:GetPos())
		defusedata:SetDamageType(64)
		util.Effect("HelicopterMegaBomb", defusedata)
		self:EmitSound("weapons/awp/awp1.wav")
		for k, v in pairs(ents.FindInSphere(self:GetPos(), 1024)) do
			if IsValid(v) and v:IsPlayer() then
				v:Kill()
			end
		end
		self:Remove()
		end)
	end
	return true
end
