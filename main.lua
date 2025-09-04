require('helpers')

function love.load()
    math.randomseed(os.time())
    love.window.setMode(1000, 768)
    love.graphics.setDefaultFilter("nearest", "nearest")

    anim8 = require 'libraries/anim8/anim8'
    cameraFile = require 'libraries/hump/camera'
    wf = require 'libraries/windfield/windfield'
    setupWorld()
    camera = cameraFile()

    sprites = {
        playerSheet = love.graphics.newImage('sprites/player_sheet.png'),
        beanSack = love.graphics.newImage('sprites/bean_sack.jpg'),
        base = love.graphics.newImage('sprites/base.png'),
    }

    local sounds = {
        music = love.audio.newSource("audio/music.mp3", "stream")
    }
    sounds.music:setLooping(true)
    sounds.music:setVolume(0.15)
    sounds.music:play()
    
    require('base')
    require('player')
end

function love.update(dt)
    world:update(dt)

    local px, py = player:getPosition()
    -- camera:lookAt(px, love.graphics.getHeight() / 2)

    updatePlayer(dt)
end

function love.draw()
    love.graphics.clear(0.25, 0.88, 0.82, 1)
    world:draw()

    local px, py = player:getPosition()
    drawBase(px, py)
    drawPlayer(px, py)
end

function setupWorld()
    world = wf.newWorld(0, 800, false)
    world:setQueryDebugDrawing(true)
    world:setGravity(0, 0) -- kekw
end

function love.keypressed(key)
    if key == "space" and player.body then
        sprintPlayer()
    end
end
