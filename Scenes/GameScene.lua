local composer = require( "composer" )

local scene = composer.newScene()

local gameView = require( "Views.GameView" )
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- View
local topBox = gameView.topBox()
local bottomBox = gameView.bottomBox()
local object = gameView.object()

--Variables
local currentBox  -- holds current box the object is intersectin with

local function checkObjectIn( target,box )
    if math2.checkIntersection(target,box) then
        if box.name == "topBox" then
            currentBox = topBox
        elseif box.name == "bottomBox" then
            currentBox = bottomBox
        end
    else
        currentBox = nil
    end
end

local function onObjectTouch( event )
    local phase = event.phase
    local target = event.target

    if phase == "began" then
        target.previousY = target.y
    elseif phase == "moved" then
        local deltaY = event.y - event.yStart
        target.y = deltaY + target.previousY

        -- Check if object is movine up or down
        if deltaY < 0 then  -- moving up the screen
            checkObjectIn(target, topBox)
        else 
            checkObjectIn(target, bottomBox)
        end
    else 
        -- Check if user released touch while intersection is happening
        if currentBox ~= nil then
            target.y = currentBox.y
        else
            target.y = screen.cY
        end
        
    end
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    sceneGroup:insert( gameView.group )

    object:addEventListener( "touch", onObjectTouch )
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene