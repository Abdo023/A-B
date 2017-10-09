local l = {}

function l.horizontalLayout( width )
	local group = display.newGroup( )
	group.anchorChildren = true -- In order to keep the group's position

	group.children = {}

	function group.sort(  )
		for i=1, #group.children do
			local child = group.children[i]
			child.width = width/#group.children
			child.x = group.x - child.width * -i
			--[[
			print( "Child.width: "..child.width )
			print( "Child.x: "..child.x )
			print( "Children Count: "..#children )
			]]
		end
	end

	function group.add( obj )
		group:insert( obj )	
		group.children[#group.children+1] = obj
		group.sort()
	end

	function group.remove( obj )
		-- Flag the object that needs to be removed
		obj.remove = true

		-- Itereate over the table backwards
		for i=#group.children, 1, -1 do
			if group.children[i].remove then
				-- Remove from table then from display
				table.remove( group.children, i )
				display.remove( obj )
			end
		end
		
		group.sort()
	end

	return group
end

return l