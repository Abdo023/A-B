local screen = {}

 screen.cX  = display.contentCenterX
 screen.cY  = display.contentCenterY

 screen.width   = display.actualContentWidth
 screen.height    = display.actualContentHeight
 screen.left     = U.cX - U.sW * 0.5
 screen.right    = U.cX + U.sW * 0.5
 screen.top      = U.cY - U.sH * 0.5
 screen.bottom   = U.cY + U.sH * 0.5

return screen