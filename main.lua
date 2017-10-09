-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar( display.HiddenStatusBar )

screen = require ( "Utils.screen")
math2 = require ("Utils.math2")

local composer = require ("composer")
--composer.gotoScene( "Scenes.GameScene" )
composer.gotoScene( "Scenes.LevelSelectScene" )