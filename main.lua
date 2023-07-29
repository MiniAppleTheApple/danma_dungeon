local wf = require('windfield')

local Player = require('player')

local world, player

function love.load()
    world = wf.newWorld(0, 0, true)
    player = Player.new({
        collider = world:newRectangleCollider(0, 0, 32, 32),
    })
end

function love.update(dt)
    player:update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.clear(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    player:draw()
    world:draw()
end