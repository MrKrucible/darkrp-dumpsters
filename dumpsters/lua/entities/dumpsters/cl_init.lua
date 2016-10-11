include( "shared.lua" )local function j_scoreboard_createfont( i, name, font_name )	local font_size = i	surface.CreateFont( name .. font_size,{		font = font_name,		size = font_size,		weight = 500	} )endlocal amount_to_create = 150for i = 1, amount_to_create do	j_scoreboard_createfont( i, "tupac_dumpsters_font_", "Bebas Neue Bold" )end
function ENT:Draw()	self:DrawModel()	local jump = math.abs( math.cos( CurTime() * 3 ) )	local Ang = self:GetAngles()	Ang:RotateAroundAxis(Ang:Up(), 90);	Ang:RotateAroundAxis(Ang:Forward(), 90);	local Offset = Vector( 0, 0, 50 )	local Pos = self:GetPos() + Offset	cam.Start3D2D( Pos, Angle( 0, LocalPlayer():EyeAngles().y - 90, 90 ), 0.1 )		draw.RoundedBox( 0, -300, -400, 600, 300, Color( 0, 0, 0, 200 ) )		if self:GetCooldown_Time() <= 0 then			draw.DrawText( "Dumpster", "tupac_dumpsters_font_150", 0, -400, color_white, 1 )			draw.DrawText( "Press E to USE", "tupac_dumpsters_font_80", 0, -280, color_white, 1 )			draw.DrawText( "Must be Hobo job.", "tupac_dumpsters_font_65", 0, -200, color_white, 1 )		elseif self:GetCooldown_Time() > 0 then			draw.DrawText( "Cooldown:", "tupac_dumpsters_font_65", 0, -400, color_white, 1 )			draw.DrawText( string.FormattedTime( self:GetCooldown_Time(), "%01i:%02i"), "tupac_dumpsters_font_150", 0, -300, color_white, 1 )		end	cam.End3D2D()end