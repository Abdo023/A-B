local d = {}

d.currentLevel = 1
d.levelTarget = 2
d.levelProgress = 0

d.difficulty = "novice"

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

return d