local mapname = game.GetMap() -- or "yourmapname"

local function isfirsttime()
	local filename = mapname .. "_htmlshown.txt"
	
	if file.Read( filename, "DATA" ) then
		return false
	else
		file.Write( filename, "1" )
		return true
	end
end

local function showhtmlonentrance()
	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 640, 480 )
	DermaPanel:SetDraggable( true )
	DermaPanel:SetTitle( "Welcome" ) -- window name
	DermaPanel:SetMinWidth( 640 )
	DermaPanel:SetMinHeight( 480 )
	DermaPanel:ShowCloseButton( true )
	DermaPanel:SetSizable( true )
	
	local html = vgui.Create( "DHTML" , DermaPanel )
	html:Dock( FILL )
	html:SetHTML( [[
		<body>HELL0!</body>
	]] )
	-- or html:OpenURL( "https://www.google.com/" )
	
	DermaPanel:MakePopup()
	DermaPanel:Center()
end

net.Receive( "hellohtml", function( len, ply )
	if isfirsttime() then showhtmlonentrance() end
end )
