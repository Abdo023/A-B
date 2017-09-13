local math2 = {}

-- Declare math libraries
math2.mSqrt = math.sqrt
math2.mRand = math.random
math2.mRound = math.round

-- Get distance between 2 objects
math2.getDistance = function ( obj1, obj2 )
    local factor = {
        x = obj2.x - obj1.x,
        y = obj2.y - obj1.y
    }
    return math2.mSqrt((factor.x * factor.x) + (factor.y * factor.y))
end

math2.getYDistance = function ( y1, y2 )
    local factor = {
        y = y2 - y1
    }
    return math2.mSqrt(factor.y * factor.y)
end

--Check for non-physics intersections

function math2.checkIntersection(obj1, obj2)
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

function math2.checkIntersectionCircle( obj1, obj2 )
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

return math2