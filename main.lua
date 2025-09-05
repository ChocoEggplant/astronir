require('helpers')

function love.conf(t)
  t.console = true
end

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
    }

    local sounds = {
        music = love.audio.newSource("audio/meepmoop.mp3", "stream")
    }
    sounds.music:setLooping(true)
    sounds.music:setVolume(0.15)
    sounds.music:play()

    require('plants')
    require('base')
    require('player')
end

function love.update(dt)
    world:update(dt)

    local px, py = player:getPosition()
    camera:lookAt(px, py)

    updatePlayer(dt)
    updatePlants(dt)
end

function love.draw()
    love.graphics.clear(0.25, 0.88, 0.82, 1)
    camera:attach()
    world:draw()

    local px, py = player:getPosition()
    drawBase(px, py)
    drawPlayer(px, py)
    drawPlants(px, py)
    camera:detach()
end

function setupWorld()
    world = wf.newWorld(0, 800, false)
    world:setQueryDebugDrawing(true)
    world:setGravity(0, 0) -- kekw
end

function love.keypressed(key)
    if key == "space" and player.body then
        --sprintPlayer()
    end
end
