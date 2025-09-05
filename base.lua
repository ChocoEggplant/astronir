StartX = 4000
StartY = 2000
local sprite = love.graphics.newImage('sprites/Base.png')
local grid = imgToGrid(sprite, 1, 1)
local animations = {
  idle = anim8.newAnimation(grid('1-1', 1), 0.3),
}


world:addCollisionClass("base", {})
base = world:newRectangleCollider(StartX, StartY, 360, 200, {
  collision_class = "base"
})

base:setType('static')

base.animation = animations.idle

function updateBase(dt)
end

function drawBase(playerX, playerY)
  base.animation:draw(sprite, StartX, StartY, nil, 3, 3)
end
