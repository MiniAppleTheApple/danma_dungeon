local Player = {
    width = 32,
    height = 32,
}

local SPEED = 200
Player.__index = Player

function Player.new(player)
    return setmetatable(player, Player)
end

function Player:draw()
    love.graphics.rectangle('fill', self.collider:getX() - Player.width / 2, self.collider:getY() - Player.height / 2, Player.width, Player.height)
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