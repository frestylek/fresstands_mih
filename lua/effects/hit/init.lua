
function EFFECT:Init( data )


    	

	self.Position = data:GetOrigin()

	self.Normal = data:GetNormal()

    local owner = data:GetEntity()
	
	local emitter = ParticleEmitter( self.Position, true )

    local particle1 = emitter:Add( "effects/hit.vmt", self.Position)

    local particle2 = emitter:Add( "effects/hit2", self.Position)

    if owner:IsValid() and !owner:GetNoDraw() then 

    particle1:SetPos(self.Position + (self.Normal * 5))
	
    particle1:SetDieTime(0.2)

    particle1:SetStartAlpha(255)
	
    particle1:SetEndAlpha(0)

    particle1:SetEndSize(15*data:GetMagnitude())

    particle1:SetStartSize(0)

    particle1:SetAngles(self.Normal:Angle() or self.Owner:GetAimVector())

    particle1:SetVelocity(self.Normal * 5)

    particle2:SetPos(self.Position + (self.Normal * 5))
	
    particle2:SetDieTime(0.2)

    particle2:SetStartAlpha(255)

    particle2:SetEndAlpha(0)

    particle2:SetEndSize(15*data:GetMagnitude())

    particle2:SetStartSize(0)

    particle2:SetAngles(self.Normal:Angle() or self.Owner:GetAimVector())

    particle2:SetVelocity(self.Normal * 5)

    

	emitter:Finish()

end
end


function EFFECT:Think( )
	return false	
end

function EFFECT:Render()

end





