local v = {}

v.group = display.newGroup( )

display.setDefault( "background", 245/255, 166/255, 35/255 )

v.collection = require( "Views.Collection")

function v.levelCollection(  )
	local coll = v.collection.new(2)
	v.group:insert( coll )
	
	return coll
end


return v