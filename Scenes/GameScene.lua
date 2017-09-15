local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- Modules
local gameView = require( "Views.GameView" )
local data = require( "Data.Questions")

-- View
local topBox = gameView.topBox()
local bottomBox = gameView.bottomBox()
local groupAText = gameView.groupAText()
local groupBText = gameView.groupBText()
local objectGroup = gameView.object()
--local objectText = gameView.objectText()

-- Variables
local questions = data.questions
local currentQuestion
local currentBox  -- holds current box the object is intersectin with
local currentChoice

-- Functions
function assignData(  )
    local rand = math2.mRand(1,#questions)
    currentQuestion = questions[rand]
    groupAText.text = currentQuestion.groupA
    groupBText.text = currentQuestion.groupB
    objectGroup.text.text = currentQuestion.object
    --groupAText.text = questions[4].groupA
end

--Called in onObjectInTouch event
function checkSolution(  )
    if currentQuestion.correct == currentChoice then
        print("Correct Answer")
    else
        print( "Wrong Answer" )
    end
    objectGroup.y = screen.cY
    assignData()
end

-- Called in checkObjectIn
function objectEffect( status )
    if status == "in" then
        objectGroup.box.alpha = 0.1
        objectGroup.text:setFillColor( 127/255, 101/255, 56/255 )
    else
        objectGroup.box.alpha = 1
        objectGroup.text:setFillColor( 1,1,1 )
    end
end

local function checkObjectIn( target,box )
    if math2.checkIntersection(target,box) then
        if box.name == "topBox" then
            currentBox = topBox
            objectEffect("in")
        elseif box.name == "bottomBox" then
            currentBox = bottomBox
            objectEffect("in")
        end
    else
        currentBox = nil
        objectEffect("out")
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
            currentChoice = "a"
        else 
            checkObjectIn(target, bottomBox)
            currentChoice = "b"
        end
    else 
        -- Check if user released touch while intersection is happening
        if currentBox ~= nil then
            target.y = currentBox.y
            checkSolution()
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

    assignData()

    print( "Object Group.y: "..objectGroup.y )

    objectGroup:addEventListener( "touch", onObjectTouch )
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