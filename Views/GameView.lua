local gameView = {}

display.setDefault( "background", 245/255, 166/255, 35/255 )

gameView.group = display.newGroup( )

function gameView.topBox(  )	
	local box = display.newRoundedRect( gameView.group, 0,0, 360, 150, 5 )
	box.x = screen.cX
	box.y = 160
	box.strokeWidth = 3
	box:setStrokeColor( 127/255, 101/255, 56/255 )
	box.name = "topBox"

	return box
end

function gameView.bottomBox(  )
	local box = display.newRoundedRect( gameView.group, 0,0, 360, 150, 5 )
	box.x = screen.cX
	box.y = screen.bottom - 160
	box.strokeWidth = 3
	box:setStrokeColor( 127/255, 101/255, 56/255 )
	box.name = "bottomBox"

	return box
end

function gameView.object(  )
	local box = display.newRoundedRect( gameView.group, 0,0, 145, 50, 0 )
	box.x = screen.cX
	box.y = screen.cY
	box.strokeWidth = 3
	box:setFillColor( 1,1,1,0.1 )
	box:setStrokeColor( 127/255, 101/255, 56/255 )

	return box
end


return gameView