AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function ENT:Initialize()
	
	self:SetModel( "models/weapons/w_defuser.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
		
		phys:Wake()
		
	end
	
end

function ENT:Use( activator, caller )

	if IsValid( caller ) and caller:IsPlayer() then
		
		caller:SetPData( "bcraft_gunpowder", caller:GetPData( "bcraft_gunpowder", 0 ) + 1 )
		
		self:Remove()
		
	end

end