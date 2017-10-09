local a = {}

function a.scale( obj,time )
	local function scaleDown ()
		transition.scaleTo( obj, {
			yScale=1, 
			xScale=1, 
			time=time
			} )
	end

	local function scaleUp ()
		transition.scaleTo( obj, {
			yScale=2, 
			xScale=2, 
			time=time,
			onComplete = scaleDown
			} )
	end

	scaleUp()
end

return a