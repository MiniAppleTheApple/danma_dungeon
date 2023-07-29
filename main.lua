local wf = require('windfield')

local SPEED = 200

local world, player

function love.load()
    world = wf.newWorld(0, 0, true)
    player = {
        collider = world:newRectangleCollider(0, 0, 32, 32),
    }
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        player.collider:applyForce(0, -SPEED)
    elseif love.keyboard.isDown('s') then
        player.collider:applyForce(0, SPEED)
    end
    if love.keyboard.isDown('a') then
        player.collider:applyForce(-SPEED, 0)
    elseif love.keyboard.isDown('d') then
        player.collider:applyForce(SPEED, 0)
    end
    world:update(dt)
end

function love.draw()
    love.graphics.clear(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    world:draw()
end