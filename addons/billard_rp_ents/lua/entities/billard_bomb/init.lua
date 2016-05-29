AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local BombDisarmSound = "weapons/c4/c4_disarm.wav"
local BombPlantSound = "weapons/c4/c4_plant.wav"
local BombExplodeSound = "weapons/awp/awp1.wav"
local BompBeepSound = "weapons/c4/c4_beep1.wav"

function ENT:Initialize()
	self:SetModel("models/props_c17/BriefCase001a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(3)
	self:SetIsActive(false)
	self:SetBombTime(20)
end

function ENT:Think()
	if self:GetIsActive() and !self:GetBombTime < 1 then
		self:SetBombTime(self:GetBombTime() - 1)
		self:NextThink(CurTime() + 1)
		self:EmitSound(BombBeepSound)
	elseif self:GetIsActive() and self:GetBombTime < 1 then
		self:GoBoom()
	end
	return true
end

function ENT:Touch(toucher)
	if IsValid(toucher) then
		if toucher:GetClass() == "billard_defuser" then
			local defusedata = EffectData()
			defusedata:SetOrigin(self:GetPos())
			util.Effect("ManhackSparks", defusedata)
			self:EmitSound(BombDisarmSound)
			toucher:Remove()
			self:Remove()
		end
	end
end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		if self:GetIsActive() then
			caller:ChatPrint("This bomb is active, you only have "..self:GetBombTime().." seconds to defuse it!")
		else
			if !self:GetOwner() then
				self:SetOwner(caller)
			end
			self:SetIsActive(true)
			self:SetBombTime(20)
			self:EmitSound(BombPlantSound)
			caller:ChatPrint("You have planted the bomb. It will detonate in 20 seconds!")
		end
	end
end

function ENT:GoBoom()
	local defusedata = EffectData()
	defusedata:SetOrigin(self:GetPos())
	defusedata:SetDamageType(64)
	util.Effect("HelicopterMegaBomb", defusedata)
	elf:EmitSound(BombExplodeSound)
	for k, v in pairs(ents.FindInSphere(self:GetPos(), 1024)) do
		if IsValid(v) and v:IsPlayer() then
			v:Kill()
		end
	end
end
