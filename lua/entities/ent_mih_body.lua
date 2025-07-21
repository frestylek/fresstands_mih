AddCSLuaFile()


ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false





function ENT:Initialize()
if SERVER then
self:UseClientSideAnimation()
	self:SetOwner(self.Owner)
	self:SetHealth(self.Owner:Health())
	self:SetSolid(SOLID_BBOX)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self.removingCD = CurTime() + 0.2
	self:ResetSequence(self:LookupSequence(self.Owner:GetSequenceName(self.Owner:GetSequence())))
	self:SetSolidFlags( FSOLID_NOT_STANDABLE )
	self:SetPlaybackRate(1)
		end
end

function ENT:Think()
	if self.Owner:Health() <= 0 and SERVER then
		self:Remove()
	end
	if SERVER and self.removingCD <= CurTime() then
		self:Remove()
	end
end
