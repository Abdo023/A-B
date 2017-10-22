local gameView = {}

local button = require( "Views.Button")
local layout = require( "Views.Layout")


local paint = {
    type = "gradient",
    color1 = { 88/255, 61/255, 255/255 },
    color2 = { 48/255, 35/255, 174/255 },
    direction = "down"
}
 
local rect = display.newRect( screen.cX, screen.cY, screen.width, screen.height )
rect.fill = paint
rect:toBack()

--display.setDefault( "background", 245/255, 166/255, 35/255 )

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
	gameView.group.objectGroup = objectGroup
	gameView.group:insert( objectGroup )
	return objectGroup
end

function gameView.reasonBanner(  )
	local group = display.newGroup( )
	group.x = screen.cX
	group.y = screen.cY

	-- Create the box
	local box = display.newRect( group, 0, 0, 290, 100 )
	box:setFillColor( 179/255, 121/255, 25/255 )

	-- Create the text
	local options = {
		parent = objectGroup,
		width = 250,
		text = "Group A: Colors \nGroup B: Fruits",
		font = native.newFont( "AvenirNext-Medium", 16 ),
		align = "left"
	}
	local text = display.newText( options)
	text:setFillColor( 1,1,1 )

	-- CreateButton

	local btn = button.new({width=60, height=20, buttonColor={1,1,1}, label="OK", labelColor= {179/255, 121/255, 25/255}, font="AvenirNext-Medium"})
	btn.y = box.height/2 - btn.height/2

	group.box = box
	group:insert( box )
	group.text = text
	group:insert( text )
	group.button = btn
	group:insert( btn )
	gameView.group.reasonGroup = group
	gameView.group:insert( group )
	return group
end

function gameView.levelBar(  )
	local group = display.newGroup( )
	gameView.group.levelBar = group
	gameView.group:insert( group )
	--Create layour group
	local l = layout.horizontalLayout(200)
	l.x = screen.cX
	l.y = 40
	group.layOut = l
	group:insert( l )

	return group
end

function gameView.levelText(  )
	local text = display.newText( {
		parent = gameView.group,
		text = "Level 1",
		font = native.newFont( "Avenir Next", 16 ),
		align = "center"
	} )
	text.x = text.width
	text.y = gameView.group.levelBar.layOut.y

	gameView.group.levelText = text
	gameView.group:insert( text )
	return text
end


return gameView