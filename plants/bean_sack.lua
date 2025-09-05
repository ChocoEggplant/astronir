local sprite = love.graphics.newImage('sprites/bean_sack.png')
local grid = imgToGrid(sprite, 6, 1)
local animation = anim8.newAnimation(grid('1-6', 1), 0.75)

bean_sack = world:newRectangleCollider(200, 100, 50, 50, { collision_class = "flower" })
bean_sack.animation = animation

function updateBeanSacks(dt)
  bean_sack.animation:update(dt)
end

function drawBeanSacks(playerX, playerY)
  local x, y = bean_sack:getPosition()
  bean_sack.animation:draw(sprite, x, y, nil, 1.8, 1.8, 15, 17)
end
