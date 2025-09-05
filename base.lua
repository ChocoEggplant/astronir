
local startX = 400
local startY = 200
local sprite = love.graphics.newImage('sprites/base.png')
local grid = imgToGrid(sprite, 1, 1)
local animations = {
  idle = anim8.newAnimation(grid('1-1', 1), 0.3),
}

world:addCollisionClass("base", {})
base = world:newRectangleCollider(startX, startY, 120, 200, {
  collision_class = "base"
})

base:setType('static')

base.animation = animations.idle

function updateBase(dt)
end

function drawBase(playerX, playerY)
  base.animation:draw(sprite, startX, startY)
end
