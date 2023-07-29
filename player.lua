local Player = {}

local SPEED = 200
Player.__index = Player

function Player.new(player, world)
    player.collider:setObject(self)
    return setmetatable(player, Player)
end

function Player:draw()
    love.graphics.rectangle('fill', self.collider:getX() - self.width / 2, self.collider:getY() - self.height / 2, self.width, self.height, self.collider:getAngle())
end

function Player:update(dt)
    print(self.collider:getX())
    if love.keyboard.isDown('w') then
        self.collider:setY(self.collider:getY() - SPEED * dt)
    elseif love.keyboard.isDown('s') then
        self.collider:setY(self.collider:getY() + SPEED * dt)
    end
    if love.keyboard.isDown('a') then
        self.collider:setX(self.collider:getX() - SPEED * dt)
    elseif love.keyboard.isDown('d') then
        self.collider:setX(self.collider:getX() + SPEED * dt)
    end

end

return Player