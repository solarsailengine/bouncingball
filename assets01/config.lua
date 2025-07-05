-- Bouncing Ball Configuration
local config = {}

-- Screen boundaries in world coordinates
config.BOUND_X = 1.78  -- 16:9 aspect ratio
config.BOUND_Y = 1.0   -- Normalized height

-- Ball configuration
config.ball = {
	speed = 1.0,        -- World units per second
	radius = 0.1,       -- Size in world coordinates (doubled)
	scale = 0.1         -- Visual scale to match collision (doubled)
}

return config