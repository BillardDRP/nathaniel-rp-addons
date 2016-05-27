
hook.Add("PlayerDeath", "bspells_exorcism", function(victim, inflictor, attacker)
	if !IsValid(victom) or !IsValid(attacker) then return end
end)
