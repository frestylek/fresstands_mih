CreateConVar( "frest_UserseeStands", 1, {FCVAR_REPLICATED, FCVAR_ARCHIVE}, "If Enable only Stand User see Stands" ) 
if CLIENT then
	function frestStandsSetting(panel)
		check = panel:CheckBox("If Enable only Stand User see Stands", "frest_UserseeStands")
		check:SetValue(true)
	end
end

function frestsetting()
	spawnmenu.AddToolMenuOption("Options", "frestStands", "frestset", "Settings", "", "", frestStandsSetting)
end

hook.Add("PopulateToolMenu", "frestsetting", frestsetting)

hook.Add( "PlayerInitialSpawn", "some_unique_name", function( ply )
	ply:SetNWBool('StandUser',false)
end)

hook.Add("CanProperty", "DontJust", function(ply, property, ent)
	
	if ent:GetClass() == "ent_fres_mih" then
		return false
	else
		return true
	end
	
end)

hook.Add("CanTool", "DontJustDont", function(ply, tr, tool)
	for k, v in pairs(ents.FindByClass("fres_*")) do
	
		if tr.Entity != v then
	
			return true
		else
			return false
	
		end
	end
	
end)

	function Tak()
	end

hook.Add("Think", "SecondPrint", SecondPrint)
hook.Add("Think", "Tak", Tak)



	function SecondPrint()
	end

