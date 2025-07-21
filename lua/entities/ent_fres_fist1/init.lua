if ( SERVER ) then
AddCSLuaFile()
end
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')
/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	if self != nil then
	self:SetPoseParameter("move_y", 1)
	self:SetPoseParameter("move_X", -1)
	self:UseClientSideAnimation()
	self:SetOwner(self.Owner)
	self:SetModel("models/player/fres_mih/miharms.mdl")
	if self.Owner != nil and self.Owner:IsValid() then
self:SetRenderMode( RENDERMODE_TRANSCOLOR )
self:SetSkin(0)

end
	self:PhysicsInit( SOLID_BBOX )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_NONE )
	self:DrawShadow( false )
	self:ResetSequence( self:LookupSequence("idle") )
	self:SetNetworkedString("Owner", "World")
	local phys = self:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Wake()
	end
	elseif self.Entity == nil and SERVER then
	self:Remove()
	end
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function ENT:Think()

self:SetPos(self.Owner:GetPos())
self:SetAngles(self.Owner:GetAngles())
self:LookupSequence( "barrage_test1" )

if SERVER then
if self.Owner != nil and self.Owner:IsValid() then
if self.Owner:Health()<= 0 then
self:Remove()
end
end
end

if self:GetCycle() == 1 then
	self:Remove()
end

if self.Owner != nil then
if self.Owner:IsValid() then
if self.Owner:GetActiveWeapon():IsValid() and self.Owner:GetActiveWeapon():GetClass() != "fres_mih"	 then
self:Remove()
end
end
end
if self.Owner != nil then
if !self.Owner:IsValid() then
self:Remove()
end
end
end
/*---------------------------------------------------------
KeyValue
---------------------------------------------------------*/
function ENT:KeyValue( key, value )
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage(dmg)

end



/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller, type, value )
self:Remove()
end


/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch( entity )
end


/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch( entity )
end


/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch( entity )
end