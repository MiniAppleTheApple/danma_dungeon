local wf = require('windfield')


local world, player

function love.load()
    world = wf.newWorld(0, 0, true)
end

function love.update(dt)
    world:update(dt)
    if love.keyboard.isDown('w') then
        player.y = player.y - SPEED * dt
    elseif love.keyboard.isDown('s') then
        player.y = player.y + SPEED * dt
    end
    if love.keyboard.isDown('a') then
        player.x = player.x - SPEED * dt
    elseif love.keyboard.isDown('d') then
        player.x = player.x + SPEED * dt
    end
end

function love.draw()
    love.graphics.clear(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', player.x, player.y, player.height, player.width)
end