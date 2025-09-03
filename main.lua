function love.load()
    math.randomseed(os.time())
    love.window.setMode(1000, 768)

    anim8 = require 'libraries/anim8/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    cameraFile = require 'libraries/hump/camera'
    wf = require 'libraries/windfield/windfield'
    setupWorld()
    camera = cameraFile()

    sprites = {
        playerSheet = love.graphics.newImage('sprites/playerSheet.png'),
    }
    local grid = imgToGrid(sprites.playerSheet, 4, 5)

    local idle_row = 1
    local down_row = 2
    local right_row = 3
    local left_row = 4
    local up_row = 5
    animations = {
        idle = anim8.newAnimation(grid('1-4', idle_row), 0.3),
        down = anim8.newAnimation(grid('1-4', down_row), 0.2),
        left = anim8.newAnimation(grid('1-4', left_row), 0.2),
        right = anim8.newAnimation(grid('1-4', right_row), 0.2),
        up = anim8.newAnimation(grid('1-4', up_row), 0.2),
    }

    sounds = {
        music = love.audio.newSource("audio/music.mp3", "stream")
    }
    sounds.music:setLooping(true)
    sounds.music:setVolume(0.2)
    sounds.music:play()
    
    require('player')
end

function love.update(dt)
    world:update(dt)

    local px, py = player:getPosition()
    camera:lookAt(px, love.graphics.getHeight() / 2)

    updatePlayer(dt)
    animations.down:update(dt)
end

function love.draw()
    love.graphics.clear(0.25, 0.88, 0.82, 1)
    world:draw()
    local px, py = player:getPosition()
    player.animation:draw(sprites.playerSheet, px, py, nil, 2, 2, 13, 17)
end

function setupWorld()
    world = wf.newWorld(0, 800, false)
    world:setQueryDebugDrawing(true)
    world:setGravity(0, 0) -- kekw
end

function imgToGrid(img, ncols, nrows)
    return anim8.newGrid(
        math.floor(img:getWidth() / ncols),
        math.floor(img:getHeight() / nrows),
        img:getWidth(),
        img:getHeight()
    )
end

function love.keypressed(key)
    if key == "space" and player.body then
        sprintPlayer()
    end
end
