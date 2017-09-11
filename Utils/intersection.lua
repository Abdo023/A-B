local intersection = {}


--Check for non-physics intersections

function intersection.checkIntersection(obj1, obj2)
    if obj1 == nil then
    	print( "Obj1 = nil" )
        return false
    end
    if obj2 == nil then
    	print( "Obj2 = nil" )
        return false
    end
    local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
    local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax 
    local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
    local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax 
    return (left or right) and (up or down) 
end 

function intersection.checkIntersectionCircle( obj1, obj2 )
    if ( obj1 == nil ) then  -- Make sure the first object exists
    	print( "Obj1 = nil" )
        return false
    end
    if ( obj2 == nil ) then  -- Make sure the other object exists
    	print( "Obj2 = nil" )
        return false
    end

    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y

    local distance = U.mSqrt( dx*dx + dy*dy )
    local objectSize = (obj2.contentWidth/2) + (obj1.contentWidth/2)

    if ( distance < objectSize ) then
        return true
    end

    return false
end

return intersection