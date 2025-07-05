function loadatlas()
	local atlas = atlas()
	atlas.atlasPath = "atlas.png"
	atlas.atlasHeight = 64
	atlas.atlasWidth = 64

	local sprite
	sprite = addsprite()
	sprite.name = "ball"
	sprite.frame.x = 0
	sprite.frame.y = 0
	sprite.frame.width = 64
	sprite.frame.height = 64

	return atlas
end

return loadatlas