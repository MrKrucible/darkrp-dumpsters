--> Client
--> Position

function ENT:Initialize()

function ENT:Use( a, c )

function ENT:CreateItems()

function ENT:SpawnWeapon()
function ENT:SpawnEntity()
function ENT:SpawnProp()


	local tupac_dumpsters_prop = ents.Create( "prop_physics" )
	tupac_dumpsters_prop:SetModel( table.Random( tupac_dumpsters_config.Props ) )
	tupac_dumpsters_prop:SetPos( self:GetPos() + spawn_pos )
	tupac_dumpsters_prop:Spawn()
	timer.Simple( tupac_dumpsters_config.PropRemovalTime, function()
		if tupac_dumpsters_prop:IsValid() then
			tupac_dumpsters_prop:Remove()
		end
	end )
end

--[[
	Name:		Create Dumpsters
]]

local tupac_dumpsters_spawn_positions = get_dumpsters_spawn_pos()
function spawn_tupac_dumpsters()
	for k, v in pairs( tupac_dumpsters_spawn_positions ) do
		local tupac_dumpster = ents.Create( "tupac_dumpster" )
		tupac_dumpster:SetPos( v[ "pos" ] )
		tupac_dumpster:SetAngles( v[ "ang" ] )
		tupac_dumpster:Spawn()
		tupac_dumpster:DropToFloor()
		local tupac_dumpster_phys = tupac_dumpster:GetPhysicsObject()
		tupac_dumpster_phys:EnableMotion( false )
	end
end

hook.Add( "InitPostEntity", "spawn_dumpsters", spawn_tupac_dumpsters )