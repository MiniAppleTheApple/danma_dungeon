local wf = require('windfield')

local Player = require('player')
local Block = require('block')

local world
local entities = {a = 10}

function love.load()
    world = wf.newWorld(0, 0, true)
    table.insert(entities, Block.new({
        collider = world:newRectangleCollider(0, 0, 32, 640),
        width = 32,
        height = 640,
        mode = 'fill',
    }))
    table.insert(entities, Player.new({
        width = 32,
        height = 32,
        collider = world:newRectangleCollider(16, 16, 32, 32),
    }))
end

function love.update(dt)
    world:update(dt)
    for _, v in ipairs(entities) do
        v:update(dt)
    end
end

function love.draw()
    love.graphics.clear(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    for _, v in ipairs(entities) do
        v:draw()
    end
    world:draw()
end