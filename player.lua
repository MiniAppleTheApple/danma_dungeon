local color = require('color')
local WHITE = color.white

local Player = {}
local meta = {__index = Player}
local SPEED = 200

function Player.new(player)
    player.collider:setObject(self)
    return setmetatable(player, meta)
end

function Player:draw()
    love.graphics.setColor(WHITE)
    love.graphics.rectangle('fill', self.collider:getX() - self.width / 2, self.collider:getY() - self.height / 2, self.width, self.height, self.collider:getAngle())
end

function Player:update(dt)
    local vector = {x = 0, y = 0}
    if love.keyboard.isDown('a') then
        vector.x = -SPEED
    elseif love.keyboard.isDown('d') then
        vector.x = SPEED
    end
    if love.keyboard.isDown('w') then
        vector.y = -SPEED
    elseif love.keyboard.isDown('s') then
        vector.y = SPEED
    end
    

    self.collider:setLinearVelocity(vector.x, vector.y)
end

return Player