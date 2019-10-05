util.AddNetworkString( "hellohtml" )

hook.Add( "PlayerInitialSpawn", "ShowHTML", function( player )
	net.Start( "hellohtml" )
	net.Send( player )
end )
