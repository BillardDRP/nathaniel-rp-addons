--[[

List of Perks:
diehard - Explode on death
groundpound - Deal splash damage when hitting the group
feather - Take no fall damage
arson - Ignite targets

]]--

BPerks = {}

BPerks.PerkList = {
	["diehard"] = true,
	["groundpound"] = true,
	["feather"] = true,
	["arson"] = true,
}

local PlyMeta = FindMetaTable("Player")

function PlyMeta:HasBPerk(perk)
	return self:GetPData("bperk_"..perk, 0) > 0
end

function PlyMeta:GiveBPerk(perk)
	self:SetPData("bperk_"..perk, 1)
end

function PlyMeta:TakeBPerk(perk)
	self:SetPData("bperk_"..perk, 0)
end

function PlyMeta:TakeAllBPerks()
	for k, v in pairs(BPerks.PerkList) do
		if v then
			self:SetPData("bperk_"..tostring(k), 0)
		end
	end
end

hook.Add("PlayerDeath", "BPerks_DieHard", function(victim, inflictor, attacker)
	if !IsValid(victim) or !IsValid(attacker) or !IsPlayer(attacker) then return end
	if victim:HasBPerk("diehard") then
		
	end
end)
