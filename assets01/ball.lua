local script = require('scriptcomponent'):derive()
local config = require('config')

function script:on_init()
    -- Initialize ball physics
    self.vx = config.ball.speed
    self.vy = config.ball.speed * 0.7
    self.radius = config.ball.radius
    
    -- Start at center (0,0)
    self.x = 0
    self.y = 0
    
    -- Set scale
    local transform = getcomponent(self.entity, "transform")
    if transform then
        transform.scale = vec3(config.ball.scale, config.ball.scale, config.ball.scale)
    end
end

function script:on_update()
    -- Get delta time from engine
    local dt = Time.deltaTime
    
    -- Update position
    self.x = self.x + self.vx * dt
    self.y = self.y + self.vy * dt
    
    -- Screen bounds in world coordinates
    local bound_x = config.BOUND_X
    local bound_y = config.BOUND_Y
    
    -- Check horizontal boundaries (remember: origin is center)
    if self.x - self.radius <= -bound_x then
        self.x = -bound_x + self.radius
        self.vx = math.abs(self.vx)
    elseif self.x + self.radius >= bound_x then
        self.x = bound_x - self.radius
        self.vx = -math.abs(self.vx)
    end
    
    -- Check vertical boundaries
    if self.y - self.radius <= -bound_y then
        self.y = -bound_y + self.radius
        self.vy = math.abs(self.vy)
    elseif self.y + self.radius >= bound_y then
        self.y = bound_y - self.radius
        self.vy = -math.abs(self.vy)
    end
    
    -- Update transform
    local transform = getcomponent(self.entity, "transform")
    if transform then
        transform.translation = vec3(self.x, self.y, 0)
    end
end

return script