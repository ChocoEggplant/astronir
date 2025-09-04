
local startX = 400
local startY = 200

local grid = imgToGrid(sprites.base, 1, 1)

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
  base.animation:draw(sprites.base, startX, startY)
end
