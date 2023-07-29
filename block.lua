local Block = {}

Block.__index = Block

function Block.new(block)
    block.collider:setObject(self)
    block.collider:setType('static')
    return setmetatable(block, Block)
end

function Block:update()

end

function Block:draw()
    love.graphics.rectangle('fill', self.collider:getX() - self.width / 2, self.collider:getY() - self.height / 2, self.width, self.height, self.collider:getAngle())
end

return Block