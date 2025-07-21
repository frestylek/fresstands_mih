AddCSLuaFile()
game.AddParticles( "particles/mih/mih_aura.pcf" )
PrecacheParticleSystem( "mih_aura" )


if SERVER then
resource.AddFile("particles/mih/mih_aura.pcf")
PrecacheParticleSystem( "mih_aura" )

end	