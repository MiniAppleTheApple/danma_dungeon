local wf = require('windfield')
local color = require('color')

local GREY = color.grey

local Player = require('player')
local Block = require('block')

local SIZE = 16 

local world
local entities = {a = 10}

function love.load()
    local width, height = love.graphics.getDimensions()
    world = wf.newWorld(0, 0, true)
    table.insert(entities, Block.new({
        collider = world:newRectangleCollider(0, 0, SIZE, height),
        width = SIZE,
        height = height,
        mode = 'fill',
        color = GREY,
    }))
    table.insert(entities, Block.new({
        collider = world:newRectangleCollider(0, 0, width, SIZE),
        width = width,
        height = SIZE,
        mode = 'fill',
        color = GREY,
    }))
    table.insert(entities, Block.new({
        collider = world:newRectangleCollider(width - SIZE, 0, SIZE, height),
        width = SIZE,
        height = height,
        mode = 'fill',
        color = GREY,
    }))
    table.insert(entities, Block.new({
        collider = world:newRectangleCollider(0, height - SIZE, width, SIZE),
        width = width,
        height = SIZE,
        mode = 'fill',
        color = GREY,
    }))
    table.insert(entities, Player.new({
        width = SIZE,
        height = SIZE,
        collider = world:newRectangleCollider(16, 16, SIZE, SIZE),
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
    for _, v in ipairs(entities) do
        v:draw()
    end
    world:draw()
end