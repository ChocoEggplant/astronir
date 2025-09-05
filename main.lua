require('helpers')

function love.conf(t)
    t.console = true
end

function love.load()
    WindowHeight = 768
    WindowWidth = 1000
    math.randomseed(os.time())
    love.window.setMode(WindowWidth, WindowHeight)
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
    require('menu')
end

function love.update(dt)
    world:update(dt)

    local px, py = player:getPosition()
    if Menu then
        if py > WindowHeight then
            love.event.quit()
        end

        if player:enter('play') then
            menu_component:destroy()
            Exit:destroy()
            Exit2:destroy()
            Menu = false
            base:setX(400 + 175)
            base:setY(200 + 500)
            StartX = 400
            StartY = 200
        end
    else
        camera:lookAt(px, py)
        updatePlants(dt)
    end

    updatePlayer(dt)
end

function love.draw()
    love.graphics.clear(0.25, 0.88, 0.82, 1)
    camera:attach()

    local px, py = player:getPosition()

    world:draw()
    if Menu then
        drawMenu(px, py)
    else
        drawBase(px, py)
        drawPlants(px, py)
    end

    drawPlayer(px, py)
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
