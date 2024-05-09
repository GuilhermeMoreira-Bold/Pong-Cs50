
Ball = Class{}

function Ball:init (x,y,width,height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = 1
    self.dX = math.random(2) == 1 and 100 or -100
    self.dY = math.random(-50,50) * 1.5
end

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dX = math.random(2) == 1 and 100 or -100
    self.dY = math.random(-50,50) 
end

function Ball:update(dt)
    self.x = self.x + self.dX * dt * self.speed
    self.y = self.y + self.dY * dt  * self.speed
end

function Ball:render()
    --calculate the center of the sprite
    local centerX = self.x + self.width / 2
    local centerY = self.y + self.height / 2

   -- love.graphics.draw(self.sprite,self.x,self.y,math.rad(self.rotation),1,1,self.width / 2, self.height / 2)
    
    love.graphics.rectangle('fill', self.x,self.y,self.width,self.height)
end

function Ball:collides(paddle)
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    return true
end