local d = {}

d.currentLevel = 1
d.levelTarget = 2
d.levelProgress = 0

d.difficulty = 1

function d.addLevel(  )
	d.currentLevel = d.currentLevel + 1
end

function d.addProgress(  )
	d.levelProgress = d.levelProgress + 1
end

function d.checkProgress(  )
	if d.levelProgress >= d.levelTarget then
		d.levelProgress = 0
		d.addLevel()
		return true
	end
end

function d.setDifficulty( diff )
	d.difficulty = diff
end

function d.setLevel(  )
	if d.difficulty == 1 then
		d.levelTarget = 2
	elseif d.difficulty == 2 then
		d.levelTarget = 3
	elseif d.difficulty == 3 then
		d.levelTarget = 4
	elseif d.difficulty == 4 then
		d.levelTarget = 5
	end
end

return d