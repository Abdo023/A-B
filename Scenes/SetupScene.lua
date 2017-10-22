local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local json = require( "json" )
local questions = require("Data.Questions")

local App42API = require("App42-Lua-API.App42API")  
App42API:initialize("52c6e9e7928296ecd6e049918282bed6c3b3844a36c136f0a68759035e53bb4c","9ac02d4feeb9aa7e4417907c29b0b67c4d4ca38ef8a11d46abbfa76038a04303")

local uploadService  = App42API:buildUploadService()  -- Get the desired service

-- Decode local json file
local filename = system.pathForFile( "QuestionsJson.json", system.ResourceDirectory )
local decoded, pos, msg = json.decodeFile( filename )
 
if not decoded then
    print( "Decode failed at "..tostring(pos)..": "..tostring(msg) )
else
    print( "File successfully decoded!" )
    questions.newQ = decoded
    composer.gotoScene("Scenes.GameScene")
end


-- Download file by name from backend
--[[
local fileName = "QuestionsJson"  
local App42CallBack = {}  
uploadService:getFileByName(fileName,App42CallBack)  
function App42CallBack:onSuccess(object)     
    --print("fileName is :".. object:getFileList():getName());       
    local url = object:getFileList():getUrl()    

    local function networkListener( event )
        if ( event.isError ) then
            print ("Error requesting remote file "..fileName)
        else
            local decoded, pos, msg = json.decode( event.response )
            if not decoded then
                print( "Decode failed at "..tostring(pos)..": "..tostring(msg) )
            else
                print( "Decode Successful" )  
                questions.newQ = decoded
                print( #questions.newQ.Questions )
            end
            composer.gotoScene("Scenes.GameScene")
        end
    end
    network.request( url, "GET", networkListener )
end    
function App42CallBack:onException(exception)  
    print("Message is : "..exception:getMessage())  
    print("App Error code is : "..exception:getAppErrorCode())  
    print("Http Error code is "..exception:getHttpErrorCode())  
    print("Detail is : "..exception:getDetails())  
end  
]]

-- Download json from web
--[[
local fileName = "QuestionsJson" 
--local url = "https://drive.google.com/uc?export=download&id=0B7VUu6dHneM6UVFMcFlvVDBaV0U"
local url = "https://drive.google.com/file/d/0B7VUu6dHneM6UVFMcFlvVDBaV0U/view"
local function networkListener( event )
    if ( event.isError ) then
        print ("Error requesting remote file "..fileName)
    else
        print( "Download Successful" )
        local decoded, pos, msg = json.decode( event.response )
        print( event.response )
        if not decoded then
            print( "Decode downloaded failed at "..tostring(pos)..": "..tostring(msg) )
        else
            print( "Decode Successful" )  
            questions.newQ = decoded
        end
    end
end
network.request( url, "GET", networkListener )
]]


--composer.gotoScene("Scenes.GameScene")

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

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