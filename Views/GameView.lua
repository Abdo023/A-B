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

	gameView.group.topBox = box
	return box
end

function gameView.bottomBox(  )
	local box = display.newRoundedRect( gameView.group, 0,0, 360, 150, 5 )
	box.x = screen.cX
	box.y = screen.bottom - 160
	box.strokeWidth = 3
	box:setStrokeColor( 127/255, 101/255, 56/255 )
	box.name = "bottomBox"

	gameView.group.bottomBox = box
	return box
end

function gameView.groupAText(  )
	local options = {
		parent = gameView.group,
		text = "ElemntA-ElementB-ElementC",
		font = native.newFont( "Avenir Next", 18 ),
		align = "center",
		width = gameView.group.topBox.width - 80,
	}
	local text = display.newText( options)
	text.x = screen.cX
	text.y = gameView.group.topBox.y
	text:setFillColor( 127/255, 101/255, 56/255 )

	gameView.group.groupAText = text
	return text
end

function gameView.groupBText(  )
	local options = {
		parent = gameView.group,
		text = "ElemntA-ElementB-ElementC",
		font = native.newFont( "Avenir Next", 18 ),
		align = "center",
		width = gameView.group.topBox.width - 80,
	}
	local text = display.newText( options)
	text.x = screen.cX
	text.y = gameView.group.bottomBox.y
	text:setFillColor( 127/255, 101/255, 56/255 )

	gameView.group.groupBText = text
	return text
end

function gameView.object(  )
	local objectGroup = display.newGroup( )
	--objectGroup.anchorX = 0.5
	--objectGroup.anchorY = 0.5
	objectGroup.x = screen.cX
	objectGroup.y = screen.cY
	-- Create the box
	local box = display.newRoundedRect( objectGroup, 0,0, 145, 50, 0 )
	--box.x = screen.cX
	--box.y = screen.cY
	box.strokeWidth = 3
	box:setFillColor( 1,1,1,0.1 )
	box:setStrokeColor( 127/255, 101/255, 56/255 )

	-- Creathe the text
	local options = {
		parent = objectGroup,
		text = "Element",
		font = native.newFont( "AvenirNext-Medium", 22 )
	}
	local text = display.newText( options)
	--text.x = box.x
	--text.y = box.y
	text:setFillColor( 1,1,1 )

	objectGroup.box = box
	objectGroup.text = text
	gameView.group.objectGroup = box
	gameView.group:insert( objectGroup )
	return objectGroup
end

function gameView.resultBanner(  )

end





return gameView