local v = {}

v.group = display.newGroup( )

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
--display.setDefault( "background", 48/255, 35/255, 174/255  )

v.collection = require( "Views.Collection")

function v.levelCollection(  )
	local coll = v.collection.new(2)
	v.group:insert( coll )
	
	return coll
end


return v