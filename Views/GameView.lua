local gameView = {}

display.setDefault( "background", 245/255, 166/255, 35/255 )

gameView.group = display.newGroup( )

gameView.topBox = display.newRoundedRect( gameView.group, 0,0, 360, 150, 5 )
gameView.topBox.x = screen.cX
gameView.topBox.y = 160
gameView.topBox.strokeWidth = 3
gameView.topBox:setStrokeColor( 127/255, 101/255, 56/255 )

gameView.bottomBox = display.newRoundedRect( gameView.group, 0,0, 360, 150, 5 )
gameView.bottomBox.x = screen.cX
gameView.bottomBox.y = screen.bottom - 160
gameView.bottomBox.strokeWidth = 3
gameView.bottomBox:setStrokeColor( 127/255, 101/255, 56/255 )

return gameView