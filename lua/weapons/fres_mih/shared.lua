if ( SERVER ) then
AddCSLuaFile()
end
SWEP.PrintName		= "Made in Heaven"
SWEP.Author		= "Pucci"
SWEP.Instructions	= ""
SWEP.Category		= "JoJo Part6"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Slot			= 2
SWEP.SlotPos			= 1
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true

SWEP.ViewModelFOV		= 54
SWEP.ViewModel			= "models/weapons/c_arms.mdl"
SWEP.WorldModel			= "models/player/whitesnake/disc.mdl"
SWEP.UseHands   		= true 

SWEP.HitDistance = 40
SWEP.Damage = 0
local stando = nil
local pozycja = Vector(-15,-20,0)
local MaxRange = 150

-- Hi to everyone who read this. I hope you have fun with this mod!																																																																																																					i dont give permision to anyone to copy addon or animation or code from here :D you can ask first or i will report this <3
-- MadeInHeaven yes i know you reading this code copper again XD
-- Authors frestylek#1898 and ∂я.вяιgнт#9958
-- Discord: https://discord.gg/3VtCsUvAFf




local ActIndex = {

	[ "pistol" ]		= ACT_HL2MP_IDLE_PISTOL,

	[ "smg" ]			= ACT_HL2MP_IDLE_SMG1,

	[ "grenade" ]		= ACT_HL2MP_IDLE_GRENADE,

	[ "ar2" ]			= ACT_HL2MP_IDLE_AR2,

	[ "shotgun" ]		= ACT_HL2MP_IDLE_SHOTGUN,

	[ "rpg" ]			= ACT_HL2MP_IDLE_RPG,

	[ "physgun" ]		= ACT_HL2MP_IDLE_PHYSGUN,

	[ "crossbow" ]		= ACT_HL2MP_IDLE_CROSSBOW,

	[ "melee" ]			= ACT_HL2MP_IDLE_MELEE,

	[ "slam" ]			= ACT_HL2MP_IDLE_SLAM,

	[ "normal" ]		= ACT_HL2MP_IDLE,

	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,

	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,

	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,

	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,

	[ "duel" ]			= ACT_HL2MP_IDLE_DUEL,

	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA,

	[ "magic" ]			= ACT_HL2MP_IDLE_MAGIC,

	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER,

	[ "stando" ]		= ACT_HL2MP_IDLE

	

}

hook.Add("CalcView","yes1",function(ply, pos, angles, fov)
	
if (  LocalPlayer():IsValid() and  LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "fres_mih" and !LocalPlayer():InVehicle() and LocalPlayer():Alive() and LocalPlayer():GetViewEntity() == LocalPlayer() ) then


	
			
		
		local Maslo = {}
		
		if IsValid(ply) then

		if !ply:GetNWBool("dodo",true) then 
			
			
			
			
			
			if Maslo.DelayPos == nil then
				Maslo.DelayPos = ply:GetPos()
			end
			
			if Maslo.ViewPos == nil then
				Maslo.ViewPos = ply:GetPos()
			end
			

			Maslo.DelayFov = fov
			
			local view = {}
		
		
			local Forward = 100
			
			local Up = 70
			local Right = 20
			
			local Pitch = 0
			local Yaw = 0
				Maslo.DelayPos = Maslo.DelayPos + (ply:GetVelocity() * (FrameTime() / 100))
				Maslo.DelayFov = Maslo.DelayFov 
				fov = math.Approach(fov, Maslo.DelayFov, math.abs(Maslo.DelayFov - fov) * 100)
			
			
			
				local traceData = {}
					traceData.start  = Maslo.DelayPos
					traceData.endpos = traceData.start + angles:Forward() * -Forward 
					traceData.endpos = traceData.endpos + angles:Right() * Right
					traceData.endpos = traceData.endpos + angles:Up() * Up
					traceData.filter = ply
				
				local trace = util.TraceLine(traceData)
				
				pos = trace.HitPos
				
				if trace.Fraction < 1.0 then
					pos = pos + trace.HitNormal * 5
				end
				
				view.origin = pos
				
		

			view.angles = angles
			view.fov = fov
		 
			return view


			elseif ply:GetNWBool("dodo",true) then
			
				
			for k, v in ipairs(  ents.FindByClass("ent_fres_*" ) ) do
			if v:GetOwner() == ply then
				if Maslo.DelayPos == nil then
					Maslo.DelayPos = v:GetPos()
				end
			
				if Maslo.ViewPos == nil then
					Maslo.ViewPos = v:GetPos()
				end
			

				Maslo.DelayFov = fov
			
				local view = {}
			
		
				local Forward = 70
			
				local Up = 60
				local Right = 35
			
				local Pitch = 0
				local Yaw = 0
			
			
			
			
				Maslo.DelayPos = Maslo.DelayPos + (v:GetVelocity() * (FrameTime() / 100))


			

				Maslo.DelayFov = Maslo.DelayFov + 5
				fov = math.Approach(fov, Maslo.DelayFov, math.abs(Maslo.DelayFov - fov) * 100)
				Maslo.DelayPos.x = math.Approach(Maslo.DelayPos.x, pos.x, math.abs(Maslo.DelayPos.x - pos.x) * 0.4)
                Maslo.DelayPos.y = math.Approach(Maslo.DelayPos.y, pos.y, math.abs(Maslo.DelayPos.y - pos.y) * 0.3)
                Maslo.DelayPos.z = math.Approach(Maslo.DelayPos.z, pos.z, math.abs(Maslo.DelayPos.z - pos.z) * 0.4)
			
			
				local traceData = {}
					traceData.start  = Maslo.DelayPos
					traceData.endpos = traceData.start + v:GetForward() * -Forward 
					traceData.endpos = traceData.endpos + v:GetRight() * Right
					traceData.endpos = traceData.endpos + v:GetUp() * Up
					traceData.filter = v
				

				
				local trace = util.TraceLine(traceData)
				
				pos = trace.HitPos
				
				if trace.Fraction < 1.0 then
					pos = pos + trace.HitNormal * 5
				end
				
			view.origin = pos
			view.angles = angles
			view.fov = fov
		 
			return view
			
			end
			end
			
			return view
			
			
			end
			
			
			
	end
		end
end)

hook.Add( "ShouldDrawLocalPlayer", "DrawLocalPlayerMIH", function()
	if (  LocalPlayer():IsValid() and  LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "fres_mih" and !LocalPlayer():InVehicle() and LocalPlayer():Alive() and LocalPlayer():GetViewEntity() == LocalPlayer() ) then return true end
end )

function SWEP:Think()
local owner = self:GetOwner()

	if self.fast1 != nil and IsValid(self.fast1) and SERVER and !self.Owner:KeyDown( IN_ATTACK ) then
		self.fast1:Remove()
		self.fast1 = nil
	end


--- If not spawned for somereason

if self.r <= (CurTime() + 13)and self.gierc < 2 and self.deploying == false and (self.MIH == nil or !self.MIH:IsValid()) and SERVER then 
	self:Deploy()
end
---
--- Copper dont be mad its only checking its time stop cause u cant dodge attacks in timestop
if GetConVar( "gstands_time_stop" ) != nil and GetConVar( "gstands_time_stop" ):GetInt() == 1 and SERVER then
	self.dod = CurTime() + 1
end

--- Dodgescore
	if self.Dodgescore < 3 and self.Dodgetime <= CurTime() then
	
		self.Dodgescore = self.Dodgescore + 1
		self.Dodgetime = CurTime() + 8
	
	
	end


--- transparency or somethink like that

	if self.MIH != nil and SERVER and IsValid(self.MIH) then
		if self.a <= 1 and self.a >= 0 then
			self.a = self.a + 0.045
			self.MIH:SetColor( Color( 255, 255, 255, Lerp(self.a,100,255) ) ) 
		end

	end

--- Deploying
if self.MIH != nil and SERVER and IsValid(self.MIH) then
	

	if self.deploying == true and SERVER then
		self.x = self.Owner:GetPos()
		self.y = self.MIH:GetPos()
		self.z = self.y:Distance(self.x)
	if self.z <= 25 and SERVER then
		local ang = self.Owner:GetAngles()
		self.MIH:SetAngles (Angle (0,ang.yaw,0))
	else
		self.deploying = false

	end
end

end

----

-----  Stand Visible
	for k, v in pairs(player.GetAll()) do
	if self.MIH != nil and SERVER and IsValid(self.MIH) then
		if !v:GetNWBool('StandUser',true) and GetConVar("frest_UserseeStands"):GetBool() and SERVER then


			self.MIH:SetPreventTransmit( v, true)

		elseif v:GetNWBool('StandUser',true) and SERVER or !GetConVar("frest_UserseeStands"):GetBool() and SERVER then


	
			self.MIH:SetPreventTransmit( v, false)

		end
	end
	end
------------------------

	if self.MIH != nil and SERVER and IsValid(self.MIH) then
		self.c = self.Owner:GetPos()
		self.b = self.MIH:GetPos()
		self.e = self.c:Distance(self.b)
		if self.e > MaxRange then
			self.MIH:SetPos(self.Owner:GetPos())
		end
	end

----- Pilot Mode
	if self.Owner:GetActiveWeapon():GetClass() == "fres_mih" and self.Owner:GetNWBool('dodo',true) and SERVER and IsValid(self.MIH) then
		local ang = self.Owner:GetAngles()
		
	
	
		self.MIH:SetAngles (Angle (ang.pitch/5+(self.o),ang.yaw,self.p))


		local traceData = {}
			traceData.start  = self.Owner:GetPos()
			traceData.endpos = traceData.start + self.MIH:GetForward() * 1 
			traceData.endpos = traceData.endpos + self.MIH:GetRight() * 1 
			traceData.endpos = traceData.endpos + self.MIH:GetUp() * 1 
			traceData.filter = self.Owner



		self.c = self.Owner:GetPos()
		self.b = self.MIH:GetPos()
		self.e = self.c:Distance(self.b)
		local trace = util.TraceLine(traceData)

		if !self.Owner:KeyDown(IN_DUCK) then

				self.b = 4

		else 

				self.b = 1


		end

--                                                      Movement standa
	 
		 if ( self.Owner:KeyDown( IN_FORWARD ) ) then
 
			local test = self.MIH:GetPos() + self.Owner:GetForward() * 4
			local testod = self.c:Distance(test)
 
			if testod <= MaxRange then
				self.MIH:SetPos(self.MIH:GetPos()+ self.Owner:GetForward() * self.b)
			end
		end
  
		if ( self.Owner:KeyDown( IN_MOVERIGHT ) ) then
			local testdd = self.MIH:GetPos()+ self.Owner:GetRight() * 4
			local testodd = self.c:Distance(testdd)
			if testodd <= MaxRange then
				self.MIH:SetPos(self.MIH:GetPos() + self.Owner:GetRight() * self.b)
			end
		end
 
		if ( self.Owner:KeyDown( IN_MOVELEFT ) ) then
			local testaa = self.MIH:GetPos()+ -self.Owner:GetRight() * 4
			local testoda = self.c:Distance(testaa)
			if testoda <= MaxRange then
				self.MIH:SetPos(self.MIH:GetPos() + (-self.Owner:GetRight()) * self.b)
			end
		end
 
		if ( self.Owner:KeyDown( IN_BACK ) ) then
			local testss = self.MIH:GetPos()+ -self.Owner:GetForward() * 4
			local testods = self.c:Distance(testss)
			if testods <= MaxRange then
				self.MIH:SetPos(self.MIH:GetPos() + (-self.Owner:GetForward()) * self.b)
			end
		end
 
 
	end

	if self.Owner:KeyDown( IN_WALK ) and SERVER then
		if self.t == true then

			self.t = false 	
			if !self.Owner:GetNWBool('dodo',true) and SERVER and IsValid(self.MIH) then
				self.Owner:AddFlags(FL_ATCONTROLS)
				self.p = 0
				self.o = 0
				self.Owner:SetNWBool('dodo',true)
			elseif self.Owner:GetNWBool('dodo',true) then
				self.Owner:SetNWBool('dodo',false)
				timer.Simple(0.1, function() 
					if self.Owner != nil then
						self.Owner:RemoveFlags(FL_ATCONTROLS)
					end
				end)
			end
		timer.Simple(0.5, function()
			if self.Owner != nil then
			self.t = true
			end
		end)
		end
	end

------------------------


-----  Light Judgement

	if self.Owner:KeyPressed( IN_RELOAD ) and self.gierc < 3 and self.r <= CurTime() and !self.Owner:GetNWBool('dodo',true) then
		self.r = CurTime() + 15
		
		
			self:SetNextPrimaryFire(CurTime() + 1.6)
			self:SetNextSecondaryFire(CurTime() + 1.6)
			if self.MIH != nil and SERVER and IsValid(self.MIH) then
				self.MIH:Remove()
			end
			if self.after1 != nil and SERVER and IsValid(self.after1) then
			self.after1:SetNoDraw(true)
			end
			self.Owner:SetMoveType(MOVETYPE_NONE)
			self.Owner:SetNoDraw(true)
			self.StartPos = self.Owner:GetPos()

			if IsValid(self.Trail) then
				self.Trail:Remove()
			end
			if !IsValid(self.Trail2) and SERVER then
			self.Trail2 = (util.SpriteTrail(self.Owner, 3, Color(237,215,77,255), true, 200,0, 3, 1/(25) * 0.5, "trails/laser" ))
			end
			timer.Simple( 1.5, function()
			if IsValid(self.Trail2) then
				self.Trail2:Remove()
			end
			end)
			
			timer.Simple( 0.1, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)
				self.Owner:SetPos(self.StartPos + Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,150)))
			
			end)
			
			timer.Simple( 0.5, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)			
				self.Owner:SetPos(self.StartPos + Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,150)))
			
			end)
			
			timer.Simple(0.70, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)			
				self.Owner:SetPos(self.StartPos + Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,150)))
			
			end)
			
			timer.Simple(0.80, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)			
				self.Owner:SetPos(self.StartPos + Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,150)))
			
			end)
			
			timer.Simple(0.90, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)			
				self.Owner:SetPos(self.StartPos + Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,150)))
			
			end)
			
			timer.Simple(   1, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)			
				self.Owner:SetPos(self.StartPos + Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,150)))
			
			end)
			
			timer.Simple( 1.1, function()
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)			
				self.Owner:SetPos(self.StartPos)
			
			end)

			timer.Simple( 1.5, function()
			
				self.Owner:SetMoveType(MOVETYPE_WALK)
				self.Owner:SetNoDraw(false)	
				if self.after1 != nil and SERVER and IsValid(self.after1) then
				self.after1:SetNoDraw(false)
				end
				if self.gierc != 2 then
				self:Deploy()
				end
			end)
			
			for k,v in ipairs(ents.FindInSphere(self.Owner:GetPos(),550)) do
				if SERVER and v != self.Owner and (v:IsNPC() or v:IsPlayer() and v:Health() > 0) then
					local dmginfo = DamageInfo()
					local attacker = self.Owner
					dmginfo:SetInflictor( self.Owner )
					if ( !IsValid( attacker ) ) then attacker = self end
					dmginfo:SetAttacker( attacker )
				timer.Simple( 0.1, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end
			
				end)
			
				timer.Simple( 0.5, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
				
			
				end)
			
				timer.Simple(0.70, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
				
			
				end)
			
				timer.Simple(0.80, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
				
			
				end)
			
				timer.Simple(0.90, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
				
			
				end)
			
				timer.Simple(   1, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
				
			
				end)
			
				timer.Simple( 1.1, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
				
			
				end)

				timer.Simple( 1.5, function()
					if self.Owner != nil and IsValid(self) and IsValid(v) then
						dmginfo:SetDamage(15)
						v:TakeDamageInfo( dmginfo )
					end			
			
				end)
			end
			end

	
	end
------------------------
-----  Final Gear and Universe Reset
	if self.Owner:KeyPressed( IN_ALT1 ) and self.gear <= CurTime() then
		if self.gierc == 0  and !self.Owner:KeyDown(IN_USE) then	
			self:SetNextSecondaryFire(CurTime() + 800000)
			self.actd:Stop()
			self.actd:SetSoundLevel(100)
			self.actd:PlayEx(1, 100)
			self.gear = CurTime() + 2 --35
			self.gierc = 1
			if SERVER then
				self.Owner:SetRunSpeed(900)
			end
		elseif self.gierc == 1 and !self.Owner:KeyDown(IN_USE) then	
			if self.r <= CurTime() then
			self.r = CurTime() - 12
			end
			self.gear = CurTime() + 2 --60
			self.Owner:SetMoveType(MOVETYPE_NONE)
			self.actd:Stop()
			self.actd:SetSoundLevel(100)
			self.actd:PlayEx(2, 100)
			timer.Simple(3,function()
			self.gierc = 2
			timer.Simple(0.1,function()
				if self.MIH != nil and SERVER and IsValid(self.MIH) then
					self.MIH:Remove()
				end
			end)
			self.Owner:SetMoveType(MOVETYPE_WALK)
			self.Owner:SetRenderMode(RENDERMODE_NONE)
			self:SetNextSecondaryFire(CurTime() + 800000)
			end)
		
			if SERVER then
				self.Owner:SetRunSpeed(1200)
			end
		elseif self.gierc == 2 and !self.Owner:KeyDown(IN_USE) then -- UNIVERSE RESET
			self.gear = CurTime() + 120
			self.r = CurTime() + 15
			self.resetd:Stop()
			self.resetd:SetSoundLevel(500)
			self.resetd:PlayEx(5, 100)
			self.Owner:SetMoveType(MOVETYPE_NONE)
			timer.Simple(8,function()
			self.gierc = 3
			self.num = 0
			self.Owner:SetNoDraw(true)
			self.Owner:SetMoveType(MOVETYPE_NONE)
			self.Owner:SetSolid(SOLID_NONE)
			end)
			timer.Simple(25, function()
				self.Owner:SetNoDraw(false)
				self.Owner:SetMoveType(MOVETYPE_WALK)
				self.Owner:SetRenderMode(RENDERMODE_NORMAL)
				if IsValid(self.Trail3) then 
					self.Trail3:Remove()
				end
				for k, v in ipairs( ents.GetAll() ) do
				if IsValid(v) and ((v:IsPlayer() and v != self.Owner) or v:IsNPC()) and SERVER then
					if SERVER then
					v:SetLaggedMovementValue( 0.05 )
					end
					self.Owner:SetPos(v:GetPos() + v:GetForward() * -50)
					timer.Simple(0.2,function()
						self.Owner:SetPos(v:GetPos() + v:GetForward() * -50 + v:GetRight() * -50)
						timer.Simple(0.2,function()
							self.Owner:SetPos(v:GetPos() + v:GetForward() * 50)
							timer.Simple(0.2,function()
								self.Owner:SetPos(v:GetPos() + v:GetForward() * 50 + v:GetRight() * 50)
								timer.Simple(0.2,function()
									self.Owner:SetPos(v:GetPos() + v:GetForward() * -25 + v:GetRight() * -25)
									timer.Simple(0.2,function()
										self.Owner:SetPos(v:GetPos() + v:GetForward() * 25)
										timer.Simple(0.2,function()
											self.Owner:SetPos(v:GetPos() + v:GetForward() * 25 + v:GetRight() * 25)
											self.resetde:Stop()
											self.resetde:SetSoundLevel(100)
											self.resetde:PlayEx(2, 100)
										end)
									end)
								end)
							end)
						end)
					end)
				end
				self.gierc = 0
				timer.Simple(3, function()
					if v != nil and IsValid(v) and ((v:IsPlayer() and v != self.Owner) or v:IsNPC()) and SERVER then
					v:KillSilent()
					end
					end)
				end
				timer.Simple(3, function()
					timer.Simple(3, function()
						game.CleanUpMap(false)
					end)
					self.Owner:SetSolid(SOLID_BBOX)
				end)
			end)

		
		
		elseif self.gierc <= 2 and self.Owner:KeyDown(IN_USE) then
			self.gear = CurTime() + 2 --35
			self:SetNextSecondaryFire(CurTime() + 1.5)
			self.gierc = 0
			self.Owner:SetRenderMode(RENDERMODE_NORMAL)
			timer.Simple(0.1,function()
				if IsValid(self.Trail3) then 
					self.Trail3:Remove() 
				end 
			end)
			if SERVER then
				if self.after != nil and IsValid(self.after) and SERVER then
					self.after:Remove()
					self.after = nil
				end				
				if self.after1 != nil and IsValid(self.after1) and SERVER then
					self.after1:Remove()
					self.after1 = nil
				end
				if self.after2 != nil and IsValid(self.after2) and SERVER then
					self.after2:Remove()
					self.after2 = nil
				end
				self.Owner:SetRunSpeed(450)
			end
		end
	end
	
	if self.gierc == 3 then
				if self.after != nil and IsValid(self.after) and SERVER then
					self.after:Remove()
					self.after = nil
				end				
				if self.after1 != nil and IsValid(self.after1) and SERVER then
					self.after1:Remove()
					self.after1 = nil
				end
				if self.after2 != nil and IsValid(self.after2) and SERVER then
					self.after2:Remove()
					self.after2 = nil
				end
						
						self.pocz = -1
						self.kon = 2
						if !game.SinglePlayer() then
						self.num = self.num - 0.008
						end
						if self.num < -1 then
							self.num = 1
						end
						for k, v in pairs(ents.FindByClass( "env_sun" ) ) do
							if ( IsValid( v ) ) then
								v:SetKeyValue( "sun_dir", tostring(Vector(Lerp(self.num,self.pocz,self.kon)	, 0, 0) ) )
							end
						end
	end
	
	if self.gierc == 2 then
			self.re = (self.Owner:GetVelocity().z >= 600 or self.Owner:GetVelocity().x >= 600 or self.Owner:GetVelocity().y >= 600 or self.Owner:GetVelocity().z <= -600 or self.Owner:GetVelocity().x <= -600 or self.Owner:GetVelocity().y <= -600)
			
			if self.after == nil and !IsValid(self.after) and SERVER then
				local ang = self.Owner:GetAngles()
				ent = ents.Create("ent_afterimage")
				ent:SetPos(self.Owner:GetPos())
				ent:SetOwner( self.Owner )
				ent:SetAngles (Angle (0,ang.yaw,0))
				ent:Spawn()
				self.after = ent
			elseif self.after != nil and IsValid(self.after) and SERVER then
				if self.re and SERVER then
				timer.Simple(3,function()
				if self.after != nil and IsValid(self.after) and SERVER then
					self.after:SetNoDraw(true)
				end
				if (GetConVar( "gstands_time_stop" ) != nil and (GetConVar( "gstands_time_stop" ):GetInt() == 0 )) or GetConVar( "gstands_time_stop" ) == nil then
						for k,v in ipairs(ents.FindInSphere(self.Owner:GetPos(),50)) do
							if SERVER and v != self and v != self.Owner and v != self.after and v != self.after1 and v != self.after2 and v != self.Trail3 then
								if (v:IsPlayer() ) and IsValid( v ) and SERVER then
									self.ssd:Stop()
									self.ssd:SetSoundLevel(100)
									self.ssd:PlayEx(3, 100)
									v:KillSilent()
								elseif (v:IsNPC()) and IsValid( v ) and SERVER then
									self.ssd:Stop()
									self.ssd:SetSoundLevel(100)
									self.ssd:PlayEx(3, 100)
									v:Remove()
								end
							end
						end
				end
						
						
				if !IsValid(self.Trail3) and SERVER and self.gierc == 2 then self.Trail3 = (util.SpriteTrail(self, 3, Color(237,215,77,255), true, 200,0, 2, 1/(25) * 0.5, "trails/laser" )) end
				end)
				else
					self.after:SetNoDraw(false)
					timer.Simple(0.2,function()
						if IsValid(self.Trail3) then 
							self.Trail3:Remove() 
						end 
					end)
				end
				
			self.after:SetPos(self.Owner:GetPos() + self.Owner:GetRight() * math.random(-15,15) + self.Owner:GetForward() * math.random(-15,15))
			self.after:SetAngles(Angle(0,self.Owner:GetAngles().yaw,0))
			self.after:SetColor(Color(255,255,255,math.random(170,180)))
			self.after:ResetSequence(self.Owner:GetSequence())
			if self.Owner:GetVelocity().x > 0 then
				self.after:SetPoseParameter( "move_x", self.Owner:GetPoseParameter( "move_x" ))
			elseif self.Owner:GetVelocity().x < 0 then self.after:SetPoseParameter( "move_x", self.Owner:GetPoseParameter( "move_x" )) end
			end
			if self.after1 == nil and !IsValid(self.after1) and SERVER then
				local ang = self.Owner:GetAngles()
				ent1 = ents.Create("ent_afterimage")
				ent1:SetPos(self.Owner:GetPos())
				ent1:SetOwner( self.Owner )
				ent1:SetAngles (Angle (0,ang.yaw,0))
				ent1:Spawn()
				self.after1 = ent1
			elseif self.after1 != nil and IsValid(self.after1) and SERVER then
			if self.re and SERVER then
				self.after1:SetNoDraw(true)
			else
				self.after1:SetNoDraw(false)
			end
			
			self.after1:SetPos(self.Owner:GetPos() + self.Owner:GetRight() * math.random(-15,15) + self.Owner:GetForward() * math.random(-15,15))
			self.after1:SetAngles(Angle(0,self.Owner:GetAngles().yaw,0))
			self.after1:SetColor(Color(255,255,255,math.random(170,180)))
			self.after1:ResetSequence(self.Owner:GetSequence())
			if self.Owner:GetVelocity().x > 0 then
				self.after1:SetPoseParameter( "move_x", self.Owner:GetPoseParameter( "move_x" ))
			elseif self.Owner:GetVelocity().x < 0 then self.after1:SetPoseParameter( "move_x", self.Owner:GetPoseParameter( "move_x" )) end
			end
			if self.after2 == nil and !IsValid(self.after2) and SERVER then
				local ang = self.Owner:GetAngles()
				ent1 = ents.Create("ent_afterimage")
				ent1:SetPos(self.Owner:GetPos())
				ent1:SetOwner( self.Owner )
				ent1:SetAngles (Angle (0,ang.yaw,0))
				ent1:Spawn()
				self.after2 = ent1
			elseif self.after2 != nil and IsValid(self.after2) and SERVER then
			if self.re and SERVER then
				self.after2:SetNoDraw(true)
			else
				self.after2:SetNoDraw(false)
			end
			
			self.after2:SetPos(self.Owner:GetPos() + self.Owner:GetRight() * math.random(-15,15) + self.Owner:GetForward() * math.random(-15,15))
			self.after2:SetAngles(Angle(0,self.Owner:GetAngles().yaw,0))
			self.after2:SetColor(Color(255,255,255,math.random(170,180)))
			self.after2:ResetSequence(self.Owner:GetSequence())
			if self.Owner:GetVelocity().x > 0 then
				self.after2:SetPoseParameter( "move_x", self.Owner:GetPoseParameter( "move_x" ))
			elseif self.Owner:GetVelocity().x < 0 then self.after2:SetPoseParameter( "move_x", self.Owner:GetPoseParameter( "move_x" )) end
			end			
			hook.Add( "EntityTakeDamage", "MIHISSPEEDHECANTTAKEDAMAGE", function ( owner, dmginfo )
			if IsValid(owner) and owner:IsPlayer() and (dmginfo:GetAttacker():IsPlayer() or dmginfo:GetAttacker():IsNPC()) then
				if ( IsValid( owner ) && dmginfo:GetDamage() > 1 ) then
				local attacker = dmginfo:GetAttacker()
					if GetConVar( "gstands_time_stop" ) != nil and ((GetConVar( "gstands_time_stop" ):GetInt() == 1 or GetConVar( "gstands_time_stopping" ):GetInt() == 1)) then
						self.dod = CurTime() + 2
					end
					if self.gierc == 2 and owner == self.Owner and self.dod <= CurTime() then
						dmginfo:SetDamage(0)
						dmginfo:ScaleDamage(0)
						if (attacker:IsPlayer() or attacker:IsNPC()) then
							timer.Simple(0.01, function()
								if SERVER and IsValid(attacker) and !IsValid(self.Trail3) then
									self.x = self.Owner:GetPos():Distance(attacker:GetPos())
									self.Owner:SetPos(attacker:GetPos() + attacker:GetForward() * -self.x/2 + attacker:GetRight() * 25)
									timer.Simple(0.2, function()
										self.Owner:SetEyeAngles(attacker:GetAngles())
										self.Owner:SetPos(attacker:GetPos() + attacker:GetForward() * -50)
									end)
								end
							end)
						end
					elseif self.gierc >= 1 then
						dmginfo:ScaleDamage(0.5)
					end
				end
			end
			end)
		end
-------------------------
	
	
-----  Taunt
	if self.Owner:KeyPressed( IN_ALT2 ) and self.tauntt <= CurTime() then
		self.taunt:Stop()
		self.taunt:PlayEx(1, 100)
		self.tauntt = CurTime() + 4
	end
-------------------------

-----  Stand Movement

	if ( self.Owner:KeyDown( IN_FORWARD ) ) then
		if self.o <= 8 or self.o == nil then
			self.o = self.o + 0.2
		end
 
 

 end
  
	if ( self.Owner:KeyDown( IN_MOVERIGHT ) ) then
		if self.p <= 8 or self.o == nil then
			self.p = self.p + 0.2
		end
  
  

 end
 
	if ( self.Owner:KeyDown( IN_MOVELEFT ) ) then
		if self.p >= -8 or self.o == nil then
			self.p = self.p - 0.2
		end
  

 end
 
	if ( self.Owner:KeyDown( IN_BACK ) ) then
		if self.o >= -8 or self.o == nil then
			self.o = self.o - 0.3
		end
  

 end
 
	if !self.Owner:KeyDown( IN_FORWARD ) then
		if self.o >= 0 or self.o == nil then
			self.o = self.o - 0.1
		end
	end
 
	if !self.Owner:KeyDown( IN_BACK ) then
		if self.o <= 0 or self.o == nil then
			self.o = self.o + 0.08
		end
	end
 
	if !self.Owner:KeyDown( IN_MOVERIGHT ) then
		if self.p <= 0 or self.p == nil then
			self.p = self.p + 0.08
		end
	end
 
	if !self.Owner:KeyDown( IN_MOVELEFT ) then
		if self.p >= 0 or self.p == nil then
			self.p = self.p - 0.08
		end
	end
 
	local vm = self.Owner:GetViewModel()
	local curtime = CurTime()
	
	if self.MIH != nil and SERVER and IsValid(self.MIH) then
	
		local ang = self.Owner:GetAngles()
		local bone = "ValveBiped.Bip01_R_Hand"
		if self.MIH:GetSequence() == self.MIH:LookupSequence( "barrage_test" ) or self.MIH:GetSequence() == self.MIH:LookupSequence( "donut" ) then
			if !self.Owner:KeyDown(IN_ATTACK) then
				self.MIH:ResetSequence( self.MIH:LookupSequence("idle"))
				self.MIH:SetPlaybackRate( 0.5 )
				self.MIH:SetCycle(0)
				self.CDPOS = CurTime()
			end
			self.MIH:SetAngles (Angle (ang.pitch,ang.yaw,0))	
			if !self.Owner:GetNWBool('dodo',true) and (!self.Owner:KeyDown(IN_SPEED) or !self.Owner:KeyDown(IN_FORWARD) and self.Owner:KeyDown(IN_SPEED) or !self.Owner:KeyDown(IN_FORWARD) and !self.Owner:KeyDown(IN_SPEED) or self.Owner:KeyDown(IN_FORWARD) and !self.Owner:KeyDown(IN_SPEED) or self.Owner:KeyDown(IN_SPEED) and self.Owner:KeyDown(IN_BACK) or self.Owner:KeyDown(IN_SPEED) and self.Owner:KeyDown(IN_FORWARD)) then
				local trace = owner:GetEyeTrace()
				local tr = util.TraceLine( {
					start = self.Owner:GetShootPos(),
					endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
					filter = {self.Owner, self.MIH},
					mins = Vector( -15, -15, -15 ), 
					maxs = Vector( 15, 15, 15 ),
					mask = MASK_SHOT_HULL
				} )
	

	
				if !self.Owner:GetNWBool('dodo',true) and !self.deploying == true and not (self.Owner:KeyDown(IN_SPEED) and self.Owner:KeyDown(IN_FORWARD) and !self.Owner:KeyDown(IN_BACK)) then

					if tr.Hit then
						tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * (trace.HitPos:Distance(owner:GetShootPos()) - 25)  ,
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -0 ),
							maxs = Vector( 1, 1, 0 ),
							mask = MASK_SHOT_HULL
						} )
		
					elseif trace.HitPos:Distance(owner:GetShootPos()) <= 80 then	
						tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * (trace.HitPos:Distance(owner:GetShootPos()) / 2.5	 ),
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -0 ),
							maxs = Vector( 1, 1, 0 ),
							mask = MASK_SHOT_HULL
						} )
		
	
					else
						if !( game.SinglePlayer()) then
						tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),	
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance + (self.Owner:GetVelocity()/5),
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -8 ),
							maxs = Vector( 1, 1, 8 ),
							mask = MASK_SHOT_HULL
						} )
						else
							tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance + (self.Owner:GetVelocity()/30),
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -8 ),
							maxs = Vector( 1, 1, 8 ),
							mask = MASK_SHOT_HULL 
						} )
						end
					end

					if  self.MIH:GetSequence() == self.MIH:LookupSequence( "barrage_test" ) then
							self.MIH:SetPos(tr.HitPos + Vector( 0, 0, -60 ) )
					end
				elseif self.Owner:KeyDown(IN_SPEED) and self.Owner:KeyDown(IN_FORWARD) and !self.Owner:KeyDown(IN_BACK) then
						tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * (trace.HitPos:Distance(owner:GetShootPos()))  ,
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -0 ),
							maxs = Vector( 1, 1, 0 ),
							mask = MASK_SHOT_HULL
						} )

					if ( !IsValid( tr.Entity ) ) then
						if !( game.SinglePlayer()) then
						tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance + (self.Owner:GetVelocity()/10),
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -8 ),
							maxs = Vector( 1, 1, 8 ),
							mask = MASK_SHOT_HULL
						} )
						else
						tr = util.TraceHull( {
							start = self.Owner:GetShootPos(),
							endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance + (self.Owner:GetVelocity()/25),
							filter = {self.Owner, self.MIH},
							mins = Vector( -1, -1, -8 ),
							maxs = Vector( 1, 1, 8 ),
							mask = MASK_SHOT_HULL
						} )
						end

					if  self.MIH:GetSequence() == self.MIH:LookupSequence( "barrage_test" ) then
							self.MIH:SetPos(tr.HitPos + Vector( 0, 0, -60 ) )
					end
					
					end
				end
			end
		end		
		if !self.Owner:GetNWBool('dodo',false) and !self.deploying == true and self.CDPOS <= CurTime() then
			self.MIH:ResetSequence( self.MIH:LookupSequence(self.Owner:GetSequenceName(self.Owner:GetSequence())) )
			self.MIH:SetAngles (Angle (self.o,ang.yaw,self.p))
			self.MIHIDEAL = ((self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+60)))
			self.Pos = self.MIH:GetPos()
			--self.MIH:SetPos(self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+50))
		end
		if self.CDPOS <= CurTime() and !self.Owner:IsFlagSet(FL_DUCKING) then
			if self.MIH:GetSequence() != self.MIH:LookupSequence( "idle" ) and SERVER then
				self.MIH:ResetSequence( self.MIH:LookupSequence("idle"))
				self.MIH:SetPlaybackRate( 0.5 )
				self.MIH:SetCycle(0)
	
			end
			if !self.Owner:GetNWBool('dodo',true) and !self.deploying == true then
				self.MIH:SetAngles (Angle (self.o,ang.yaw,self.p))
				self.MIHIDEAL = ((self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+60)))
				self.Pos = self.MIH:GetPos()
				self.MIH:SetPos(LerpVector(1,self.Pos,self.MIHIDEAL))
				self.MIHIDEAL = ((self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+60)))
				---self.MIH:SetPos(self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+50))
			elseif self.deploying == true then
				self.MIH:SetAngles (Angle (self.o,ang.yaw,self.p))
				self.MIHIDEAL = ((self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+60)))
				self.Pos = self.MIH:GetPos()
				self.MIH:SetPos(LerpVector(0.3,self.Pos,self.MIHIDEAL))
				self.MIHIDEAL = ((self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+60)))
			end
		end
		if self.MIH:GetSequence() == self.MIH:LookupSequence( "wos_bs_shared_jump" ) or self.MIH:GetSequence() == self.MIH:LookupSequence( "wos_bs_shared_flourish_bow_basic" ) then
			self.MIH:SetAngles (Angle (0,ang.yaw,0))
			if !self.Owner:GetNWBool('dodo',true) and not self.deploying == true then
				self.MIH:SetPos(self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+50))
			end
		end
		if !self.Owner:GetNWBool('dodo',true) and !self.deploying == true and self.CDPOS <= CurTime() and (self.Owner:IsFlagSet(FL_DUCKING) or self.Owner:GetSequenceName(self.Owner:GetSequence()) == "cwalk_all") and !self.Owner:KeyPressed( IN_ATTACK ) and !self.Owner:KeyPressed( IN_ATTACK2 ) then
			self.MIH:SetAngles (Angle (0,ang.yaw,0))
			self.MIH:SetPos(self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.2))* 2)+15))
		end
	end
--------------------------
end

function SWEP:Initialize()
	self.Dodgescore = 3	
	self.b = 4
	self.p = 0
	self.o = 0
	self.dod = CurTime()
	self:SetDeploySpeed(0.1)
	self.resetde = CreateSound (self, "mih/MADEINHEAVEN.wav")
	self.resetd = CreateSound (self, "mih/uniwer_reset.wav")
	self.actd = CreateSound (self, "mih/time_acceleratione.wav")
	self.actdb = CreateSound (self, "mih/time_acceleratione_buck.wav")
	self.ssd = CreateSound (self, "mih/speed_slicee.wav")
	self.tak = CreateSound (self, "mih/deploy.wav")
	self.rush = CreateSound (self, "mih/loop.wav")
	self.DodgeCD = CurTime()
	self.Dodgetime = CurTime()
	self.Dodgescore = 3	
	self.deploy = CreateSound(self, "mih/deploy.wav") 
	self.deploy:SetSoundLevel(100)
	self.gear = CurTime() 
	self.dzwienk = false
	self.b = 4
	self.p = 0
	self.o = 0
	self.deploying = true
	self.CDPOS = CurTime()
	self.tauntt = CurTime()	
	self.taunt = CreateSound(self, "") 
	self.taunt:SetSoundLevel(150)
	self.prawy = CurTime()
	self.r = CurTime() - 13.5
	self.t = true
	self.RemoveCD = CurTime()
	self.trush = CurTime()
	self.gierc = 0
	timer.Simple(0.001, function()
	if IsValid(self) then
		timer.Simple(0.02, function()
			self.Owner:SetNWBool('dodo',false)
			self.Owner:SetNWBool('StandUser',true)
		end) 
		if self.Owner != nil and IsValid(self.Owner) then
			self.Owner:SetRunSpeed(450)
			self.Owner:SetSlowWalkSpeed(150)
			self.OwnerPos = self.Owner:GetPos()
			self.MIHIDEAL = self.Owner:EyePos()
			self:SetHoldType( "stando" )
			self.num = 0
		end
	
	
		self:SetDeploySpeed(0.1)
	self.resetd = CreateSound (self, "mih/uniwer_reset.wav")
	self.actd = CreateSound (self, "mih/time_acceleratione.wav")
	self.actdb = CreateSound (self, "mih/time_acceleratione_buck.wav")
	self.ssd = CreateSound (self, "mih/speed_slicee.wav")
	self.tak = CreateSound (self, "mih/deploy.wav")
	self.rush = CreateSound (self, "mih/loop.wav")
		self.DodgeCD = CurTime()
		self.Dodgetime = CurTime()
		self.Dodgescore = 3	
	self.deploy = CreateSound(self, "mih/deploy.wav") 
		self.deploy:SetSoundLevel(100)
		self.gear = CurTime() 
		self.dzwienk = false
		self.b = 4
		self.p = 0
		self.o = 0
		self.deploying = true
		self.CDPOS = CurTime()
		self.tauntt = CurTime()	
		self.taunt = CreateSound(self, "") 
		self.taunt:SetSoundLevel(150)
		self.prawy = CurTime()
		self.r = CurTime() - 13.5
		self.trush = CurTime()
		self.t = true
		self.RemoveCD = CurTime()
		self.gierc = 0
	end
	end)
end 

function SWEP:SetupDataTables()

	self:NetworkVar( "Int", 2, "Combo" )


end

function SWEP:DrawHUD()

	if self.czcionka != true and CLIENT then
		local mult = ScrW() / 1920
		self.czcionka = true
	surface.CreateFont("fontstand", {

		font = "Comic Sans MS",

		size = 18 * mult,
	
		weight = 600,
	
		blursize = 0,

		scanlines = 0,

		antialias = true,

		underline= false,

		rotary = false,

		shadow = false,

		additive = true,

		outline = false
			
	})
	end


------------ Light Judgement
		if self.r <= CurTime() and CLIENT then
			surface.SetDrawColor(180,180,180,255)
		else
			surface.SetDrawColor(0,0,0,255)
		end
			surface.DrawRect(	ScrW() - (1803 * ScrW() / 1920) - 80 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920, 60 * ScrW() / 1920, 60 * ScrW() / 1920	)	

	
	
	draw.TextShadow({

		text = "Light",

		font = "fontstand",

		pos = {ScrW() - (1803 * ScrW() / 1920) - 68 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920,},

		color = tcolor,

		xalign = TEXT_ALIGN_TOP

	}, 2 * ScrW() / 1920, 250)
	draw.TextShadow({

		text = "Judge",

		font = "fontstand",

		pos = {ScrW() - (1803 * ScrW() / 1920) - 72 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 133 * ScrW() / 1920,},

		color = tcolor,

		xalign = TEXT_ALIGN_TOP
		
	}, 2 * ScrW() / 1920, 250)

	if self.r <= CurTime() then

		draw.TextShadow({

			text = input.LookupBinding( "+Reload", true ),

			font = "fontstand",
	
			pos = {ScrW() - (1803 * ScrW() / 1920) - 55 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 115 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	else
	
		draw.TextShadow({

			text = math.floor((self.r - CurTime()) +0,5),

			font = "fontstand",
	
			pos = {ScrW() - (1803 * ScrW() / 1920) - 55 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 115 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	end
	
----------- Final Gear and Reset Universe
		if self.gear <= CurTime() and CLIENT then
		surface.SetDrawColor(180,180,180,255)
	else
		surface.SetDrawColor(0,0,0,255)
	end

	surface.DrawRect(	ScrW() - (1803 * ScrW() / 1920) + 0 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920, 60 * ScrW() / 1920, 60 * ScrW() / 1920	)	
	
	if self.gierc < 2 then
		draw.TextShadow({
	
			text = "Final",

			font = "fontstand",

			pos = {ScrW() - (1803 * ScrW() / 1920) + 12 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP

		}, 2 * ScrW() / 1920, 250)
		draw.TextShadow({

			text = "Gear",

			font = "fontstand",

			pos = {ScrW() - (1803 * ScrW() / 1920) + 15 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 133 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	
	elseif self.gierc != 0 then
	
	--[[	draw.TextShadow({

			text = "",

			font = "fontstand",

			pos = {ScrW() - (1803 * ScrW() / 1920) - 5 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920,},

			color = tcolor,
	
			xalign = TEXT_ALIGN_TOP

		}, 2 * ScrW() / 1920, 250)
]]
		draw.TextShadow({

			text = "RESET",

			font = "fontstand",

			pos = {ScrW() - (1803 * ScrW() / 1920) + 8 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 140 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	
	
	
	end
	
	if self.gear <= CurTime() and CLIENT then

		draw.TextShadow({

			text = input.LookupBinding( "+alt1", true ),

			font = "fontstand",
	
			pos = {ScrW() - (1803 * ScrW() / 1920) + 25 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 115 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	else
	
		draw.TextShadow({

			text = math.floor(( self.gear - CurTime()) +0,5),

			font = "fontstand",
	
			pos = {ScrW() - (1803 * ScrW() / 1920) + 25 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 115 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	end
	
----------- Dodge
	if self.Dodgescore > 0 and CLIENT then
		surface.SetDrawColor(180,180,180,255)
	else
		surface.SetDrawColor(0,0,0,255)
	end

	surface.DrawRect(	ScrW() - (1803 * ScrW() / 1920) + 80 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920, 60 * ScrW() / 1920, 60 * ScrW() / 1920	)	

	
	
	draw.TextShadow({

		text = "Speed",

		font = "fontstand",

		pos = {ScrW() - (1803 * ScrW() / 1920) + 88 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 150 * ScrW() / 1920,},

		color = tcolor,

		xalign = TEXT_ALIGN_TOP

	}, 2 * ScrW() / 1920, 250)
	draw.TextShadow({

		text = "Dodge",

		font = "fontstand",

		pos = {ScrW() - (1803 * ScrW() / 1920) + 88 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 136 * ScrW() / 1920,},

		color = tcolor,

		xalign = TEXT_ALIGN_TOP
		
	}, 2 * ScrW() / 1920, 250)

	if self.Dodgescore > 0 and CLIENT then

		draw.TextShadow({

			text = self.Dodgescore,

			font = "fontstand",
	
			pos = {ScrW() - (1803 * ScrW() / 1920) + 105 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 115 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
		
	else
	
		draw.TextShadow({

			text = math.floor(( self.Dodgetime - CurTime()) +0,5),

			font = "fontstand",
	
			pos = {ScrW() - (1803 * ScrW() / 1920) + 105 * ScrW() / 1920, ScrH() - (56 * ScrW() / 1920) - 115 * ScrW() / 1920,},

			color = tcolor,

			xalign = TEXT_ALIGN_TOP
		
		}, 2 * ScrW() / 1920, 250)
	end
	
	
	
	
	
	
	

end

function SWEP:SetWeaponHoldType( t )

	

	t = string.lower( t )

	local index = ActIndex[ t ]

	

	if ( index == nil ) then

		Msg( "SWEP:SetWeaponHoldType - ActIndex[ \"" .. t .. "\" ] isn't set! (defaulting to normal)\n" )

		t = "normal"

		index = ActIndex[ t ]

	end

	if ( t == "stando" ) then

		self.ActivityTranslate = {}

		self.ActivityTranslate[ ACT_MP_STAND_IDLE ]					= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "idle_suitcase" ))

		self.ActivityTranslate[ ACT_MP_WALK ]						= ACT_HL2MP_IDLE + 1

		self.ActivityTranslate[ ACT_MP_RUN ]						= ACT_HL2MP_RUN_FAST

		self.ActivityTranslate[ ACT_MP_CROUCH_IDLE ]				= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "pose_ducking_01" ))

		self.ActivityTranslate[ ACT_MP_CROUCHWALK ]					= index + 4

		self.ActivityTranslate[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_signal_forward" ))

		self.ActivityTranslate[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_signal_forward" ))

		self.ActivityTranslate[ ACT_MP_RELOAD_STAND ]				= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_becon" ))

		self.ActivityTranslate[ ACT_MP_RELOAD_CROUCH ]				= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_becon" ))

		self.ActivityTranslate[ ACT_MP_JUMP ]						= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "jump_slam" ))

		self.ActivityTranslate[ ACT_RANGE_ATTACK1 ]					= index + 8

		self.ActivityTranslate[ ACT_MP_SWIM ]						= index + 9

		else

		self.ActivityTranslate = {}

		self.ActivityTranslate[ ACT_MP_STAND_IDLE ]					= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "idle_suitcase" ))

		self.ActivityTranslate[ ACT_MP_WALK ]						= ACT_HL2MP_IDLE + 1

		self.ActivityTranslate[ ACT_MP_RUN ]						= ACT_HL2MP_RUN_FAST

		self.ActivityTranslate[ ACT_MP_CROUCH_IDLE ]				= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "pose_ducking_01" ))

		self.ActivityTranslate[ ACT_MP_CROUCHWALK ]					= index + 4

		self.ActivityTranslate[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_signal_forward" ))

		self.ActivityTranslate[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_signal_forward" ))

		self.ActivityTranslate[ ACT_MP_RELOAD_STAND ]				= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_becon" ))

		self.ActivityTranslate[ ACT_MP_RELOAD_CROUCH ]				= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "gesture_becon" ))

		self.ActivityTranslate[ ACT_MP_JUMP ]						= self.Owner:GetSequenceActivity(self.Owner:LookupSequence( "jump_slam" ))

		self.ActivityTranslate[ ACT_RANGE_ATTACK1 ]					= index + 8

		self.ActivityTranslate[ ACT_MP_SWIM ]						= index + 9

	end

	if ( t == "normal" ) then

		self.ActivityTranslate[ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM

	end	

end

function SWEP:Equip()
	local owner = self:GetOwner()
	owner:SetMaxHealth( 1500 )
	owner:SetHealth( 1500 )
end

function SWEP:Deploy()
	self.tak:Stop()
	self.tak:SetSoundLevel(100)
	self.tak:PlayEx(2, 100)
	self.CDPOS = CurTime()
	local owner = self:GetOwner()
	local speed = GetConVarNumber( "sv_defaultdeployspeed" )
	local vm = self.Owner:GetViewModel()
	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	if ( SERVER ) then
		self:SetCombo( 0 )
	end
	self.MIH = nil
	if SERVER and (self.MIH == nil or !self.MIH:IsValid()) then
		
		self.a = 0
		stando = ents.Create("ent_fres_mih")
		local ang = self.Owner:GetAngles()
		if stando:IsValid() then
			stando:SetPos(self.Owner:GetPos())
			stando:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
			stando:SetMoveType(MOVETYPE_NONE)
			stando:SetColor( Color( 255, 255, 255, 255 ) ) 
			stando:SetAngles (Angle (0,ang.yaw,0))
			stando:SetOwner( self.Owner )
			stando:Spawn()
			self.deploy:PlayEx(1, 100)
			self.MIH = stando
			self.MIHIDEAL = (self.Owner:GetPos())
		end 
	end
	
	return true

end

function SWEP:Holster( wep )
	local owner = self:GetOwner()
	if SERVER then
		self.Owner:SetRenderMode(RENDERMODE_NORMAL)
		self.deploy:Stop()
		self.Owner:SetSlowWalkSpeed(1)
		self.Owner:SetRunSpeed(400)
		self.Owner:SetLaggedMovementValue( 1 )
		self.deploying = true
		self.a = 0
		self.t = false
		if self.MIH != nil and IsValid(self.MIH) then
			self.MIH:Remove()
			self.MIH = nil
		end
		if self.after != nil and IsValid(self.after) and SERVER then
			self.after:Remove()
			self.after = nil
		end
		if self.after1 != nil and IsValid(self.after1) and SERVER then
			self.after1:Remove()
			self.after1 = nil
		end
		self.Owner:SetNWBool('dodo',false)

			if IsValid(self.Owner) and IsValid(self) then
				self.Owner:RemoveFlags(FL_ATCONTROLS)
			end
	end
	if self.Owner != nil then
		self.Owner:StopParticles()
				self.gierc = 0 
	end
	return true
end

function SWEP:PrimaryAttack()
	self.Owner:LagCompensation( true )
	self:punch()
	self:SetNextPrimaryFire(CurTime() + 0.5)
	self:punch()
	--[[if self.fast1 == nil and !IsValid(self.fast1) and SERVER then
					fastpunh1 = ents.Create("ent_fres_fist1")
					local ang = self.Owner:GetAngles()
					if fastpunh1:IsValid() then
						fastpunh1:SetPos(self.Owner:GetPos())
						fastpunh1:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
						fastpunh1:SetMoveType(MOVETYPE_NONE)
						fastpunh1:SetColor( Color( 255, 255, 255, 255 ) ) 
						fastpunh1:SetAngles (Angle (0,ang.yaw,0))
						fastpunh1:SetOwner( self.Owner )
						fastpunh1:Spawn()
						self.fast1 = fastpunh1
					end
				end

	if self.fast1 != nil and IsValid(self.fast1) and SERVER then
		self.fast1:ResetSequenceInfo()
		self.fast1:RemoveAllGestures()
		self.fast1:ResetSequence(self.fast1:LookupSequence( "barrage_test1" ))
		self.fast1:SetCycle(0)
		self.fast1:SetPlaybackRate( 1 )
	end
	]]
	if self.MIH != nil and SERVER and IsValid(self.MIH) then
		timer.Simple(0.15, function()
			if	self.MIH != nil and SERVER and IsValid(self.MIH) then 
				self:DealDamage() 
			end 
		end) 
		self:SetNextPrimaryFire(CurTime() + 0.5)
			if self.MIH != nil and (!self.Owner:IsFlagSet(FL_DUCKING) or !self.Owner:GetSequenceName(self.Owner:GetSequence()) == "cwalk_all") and SERVER and IsValid(self.MIH) then
				self.MIH:ResetSequenceInfo()
				self.MIH:RemoveAllGestures()
				self.MIH:ResetSequence(self.MIH:LookupSequence( "barrage_test" ))
				self.MIH:SetCycle(0)
				self.MIH:SetPlaybackRate( 1.5 )
				self.CDPOS = CurTime()+((self.MIH:SequenceDuration()))
			end
	end
	self.Owner:LagCompensation( false )
end

function SWEP:SecondaryAttack()

-----  Speed Dodge
	if not self.DodgeCD or self.DodgeCD <= CurTime() and self.Dodgescore > 0 and !self.Owner:GetNWBool('dodo',true) and self.gierc <= 1 then
		self.DodgeCD = CurTime() + 1
		self.Dodgescore = self.Dodgescore - 1
		if SERVER then
				self.ssd:Stop()
				self.ssd:SetSoundLevel(100)
				self.ssd:PlayEx(1, 100)
		self.Trail = (util.SpriteTrail(self, 3, Color(237,215,77,255), true, 200,0, 0.5, 1/(25) * 0.5, "trails/laser" ))
		self.Owner:SetLaggedMovementValue( 10 )
		if !game.SinglePlayer() then
		timer.Simple(0.001, function()
			timer.Simple(0.45, function()
				if IsValid(self.Trail) then
					self.Trail:Remove()
				end
			end)
			self.Owner:SetLaggedMovementValue( 1 )
		end)
		else
			timer.Simple(0.1, function()
			timer.Simple(0.45, function()
				if IsValid(self.Trail) then
					self.Trail:Remove()
				end
			end)
			self.Owner:SetLaggedMovementValue( 1 )
		end)
		end
		end
			
	end
--------------------------

end

function SWEP:Reload()
end

function SWEP:DealDamage()
	if self.MIH != nil and IsValid(self.MIH) then
		if self.Owner:KeyDown(IN_ATTACK) and self.trush <= CurTime() then
			self.rush:Stop()
			self.rush:PlayEx(1, 100)
			self.trush = CurTime() + 2
		end
		if !self.Owner:KeyDown(IN_ATTACK) then
			self.rush:Stop()
		end
		
		local bone = "ValveBiped.Bip01_R_Hand"
		local bone1 = "ValveBiped.Bip01_L_Hand"
		local anim = self:GetSequenceName(self.Owner:GetViewModel():GetSequence())
		self.Owner:LagCompensation( true )
		local owner = self:GetOwner()

		local tr = util.TraceLine( {
			start = self.MIH:GetBonePosition(self.MIH:LookupBone(bone)),
			endpos = self.MIH:GetBonePosition(self.MIH:LookupBone(bone)) + self.MIH:GetForward() * self.HitDistance,
			filter = {self.Owner, self.MIH},
			mask = MASK_SHOT_HULL
		} )
		local treff = util.TraceLine( {
			start = self.MIH:GetBonePosition(self.MIH:LookupBone(bone)),
			endpos = self.MIH:GetBonePosition(self.MIH:LookupBone(bone)) + self.MIH:GetForward() * self.HitDistance,
			filter = {self.Owner, self.MIH},
			mask = MASK_SHOT_HULL
		} )


		local treff1 = util.TraceLine( {
			start = self.MIH:GetBonePosition(self.MIH:LookupBone(bone1)),
			endpos = self.MIH:GetBonePosition(self.MIH:LookupBone(bone1)) + self.MIH:GetForward() * self.HitDistance,
			filter = {self.Owner, self.MIH},
			mask = MASK_SHOT_HULL
		} )



		if tr.Hit then

			

			local effectdata = EffectData()
			if self.attack == true then
			
				effectdata:SetOrigin(treff.HitPos)

			else
			
				effectdata:SetOrigin(treff.HitPos)
			
			end
			
			effectdata:SetNormal(-self.MIH:GetForward())
			
			effectdata:SetEntity(self.Owner)
			
			effectdata:SetMagnitude(1)

			util.Effect( "hit", effectdata)
			
			self.attack = (!self.attack)
			
			if tr.Hit and not tr.Entity:IsNPC() and not tr.Entity:IsPlayer() then

				local hitent = tr.Entity
				local phys = owner:GetPhysicsObject()
				owner:SetVelocity(owner:GetAimVector() * -10* phys:GetMass(), tr.HitPos)	
			end
		end
	
	
		if ( !IsValid( tr.Entity ) ) then
			tr = util.TraceHull( {
				start = self.MIH:GetBonePosition(self.MIH:LookupBone(bone)),
				endpos = self.MIH:GetBonePosition(self.MIH:LookupBone(bone)) + self.MIH:GetForward() * self.HitDistance,
				filter = {self.Owner, self.MIH},
				mins = Vector( -10, -10, -8 ),
				maxs = Vector( 10, 10, 8 ),
				mask = MASK_SHOT_HULL
			} )
		end

	-- We need the second part for single player because SWEP:Think is ran shared in SP
		if ( tr.Hit && !( game.SinglePlayer() && CLIENT ) ) then
		end

		local hit = false

		if ( SERVER && IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:GetPhysicsObject() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) ) then
			local dmginfo = DamageInfo()
			local attacker = self.Owner
			if ( !IsValid( attacker ) ) then attacker = self end
			dmginfo:SetAttacker( attacker )
			if tr.Entity:IsPlayer() then
				local effectdata = EffectData()
				effectdata:SetOrigin(tr.Entity:GetPos()+Vector(0,0,40))
				effectdata:SetNormal(tr.Entity:GetPos()+Vector(0,0,40))
				effectdata:SetAngles(tr.Entity:GetAngles())
				effectdata:SetFlags(3)
				effectdata:SetColor(0)
				effectdata:SetScale(10)
				util.Effect("bloodspray", effectdata)
				util.Effect("bloodimpact", effectdata)
				timer.Simple(1.5, function() if tr.Entity != nil then tr.Entity:SetLaggedMovementValue(1) end end)
				tr.Entity:SetLaggedMovementValue( 0.5 )
			end
			if tr.Entity:IsNPC() then
				local effectdata = EffectData()
				effectdata:SetOrigin(tr.Entity:GetPos()+Vector(0,0,40))
				effectdata:SetNormal(tr.Entity:GetPos()+Vector(0,0,40))
				effectdata:SetAngles(tr.Entity:GetAngles())
				effectdata:SetFlags(3)
				effectdata:SetColor(0)
				effectdata:SetScale(10)
				util.Effect("bloodspray", effectdata)
			end

		
			dmginfo:SetInflictor( self )
			if self.MIH:GetSequence() == self.MIH:LookupSequence( "barrage" ) then
				dmginfo:SetDamage(65)
				local hitent = tr.Entity
				if SERVER and hitent:GetMoveType() == MOVETYPE_VPHYSICS then
					local phys = hitent:GetPhysicsObject()
					if phys and phys:IsValid() then
						phys:ApplyForceOffset( owner:GetAimVector() * 500 * phys:GetMass(), tr.HitPos)
						hitent:SetPhysicsAttacker(owner)
					end
				end
			else
				dmginfo:SetDamage(240)
				local hitent = tr.Entity
				if SERVER and hitent:GetMoveType() == MOVETYPE_VPHYSICS then
					local phys = hitent:GetPhysicsObject()
					if phys and phys:IsValid() then
						phys:ApplyForceOffset( owner:GetAimVector() * 3000 * phys:GetMass(), tr.HitPos)
						hitent:SetPhysicsAttacker(owner)
					end
				end
			end
		
			dmginfo:SetDamageForce( self.MIH:GetRight() * 4912 + self.MIH:GetForward() * 9998 )
			tr.Entity:TakeDamageInfo( dmginfo )
			hit = true
		end

		if ( SERVER ) then
			if ( hit && anim != "barrage" ) then
				self:SetCombo( self:GetCombo() + 1 )
			else
				self:SetCombo( 0 )
			end
		end

		self.Owner:LagCompensation( false )
	elseif SERVER and (self.MIH == nil or !self.MIH:IsValid()) then
		stando = ents.Create("ent_fres_mih")
		local ang = self.Owner:GetAngles()
		if stando:IsValid() then
			stando:SetPos(self.Owner:EyePos() + (self.Owner:GetForward() * pozycja.x) + (self.Owner:GetRight() * pozycja.y) - Vector(0,0,(math.cos((CurTime() * 3 * 0.4))* 5)+30))
			stando:SetCollisionGroup(COLLISION_GROUP_PLAYER)
			stando:SetMoveType(MOVETYPE_NONE)
			stando:SetAngles (Angle (0,ang.yaw,0))
			stando:SetOwner( self.Owner )
			stando:Spawn()
			self.MIH = stando
		end
	end
end 

function SWEP:OnRemove()
	if SERVER then
		if self.MIH != nil and IsValid(self.MIH) then
			self.MIH:Remove()
		end
		if self.after != nil and IsValid(self.after) and SERVER then
			self.after:Remove()
			self.after = nil
		end		
		if self.after1 != nil and IsValid(self.after1) and SERVER then
			self.after1:Remove()
			self.after1 = nil
		end
		self.a = 0
		if self.Owner != nil and IsValid(self.Owner) then
			self.Owner:SetSlowWalkSpeed(100)
			self.Owner:SetLaggedMovementValue( 1 )
			self.Owner:SetNWBool('StandUser',false)
			if IsValid(self.Trail2) then
				self.Trail2:Remove()
			end
			self.Owner:SetRunSpeed(400)
		end
		self.t = false
	end
	self.taunt:Stop()
	MIHGRAV = false
end

if CLIENT then
	function SWEP:DrawWorldModel()
		if IsValid(self.Owner) then
			return false
			else
			self:DrawModel()
		end
	end
end

function SWEP:punch()
    local owner = self:GetOwner()
	local aimvector = owner:GetAimVector()
	
    local tr = util.TraceLine( {
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
		filter = {self.Owner, self.MIH, self.after, self.after1, self.after2},
		mask = MASK_SHOT_HULL
	} )

	if ( !IsValid( tr.Entity ) ) then
		tr = util.TraceHull( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
			filter = {self.Owner, self.MIH, self.after, self.after1, self.after2},
			mins = Vector( -10, -10, -8 ),
			maxs = Vector( 10, 10, 8 ),
			mask = MASK_SHOT_HULL
		} )
	end
	
	
	local hitent = tr.Entity
	
	if tr.Hit and not ( game.SinglePlayer() and CLIENT ) then
		util.ScreenShake( owner:GetPos(), 3, 2, .3, 455 )
	end
	
	if SERVER and hitent:IsValid() then
		if SERVER and hitent:GetMoveType() == MOVETYPE_VPHYSICS then
			local phys = hitent:GetPhysicsObject()
			if phys and phys:IsValid() then
				end
		end
    end
end
	
function SWEP:OnDrop()
	self:Remove() -- You can't drop fists-
end