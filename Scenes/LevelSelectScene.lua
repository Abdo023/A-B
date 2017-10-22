local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- Modules
local view = require( "Views.LevelSelectView")
local gameData = require( "Data.GameData" )
-- View
local collection = view.levelCollection()

-- Variables
local difficulties = {"Novice", "Educated", "Knowledgable", "Intelligent"}


-- Functions

function onCollectionButton( event )
    if event.target.id == 1 then
        gameData.setDifficulty(1)
    elseif event.target.id == 2 then
        gameData.setDifficulty(2)
    elseif event.target.id == 3 then
        gameData.setDifficulty(3)
    elseif event.target.id == 4 then
        gameData.setDifficulty(4)
    end
    gameData.setLevel()
    composer.gotoScene( "Scenes.GameScene" )
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    sceneGroup:insert( view.group )

    collection.addItems(difficulties)
    for i=1,#collection.btns do
        collection.btns[i].setAction (onCollectionButton)
    end
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