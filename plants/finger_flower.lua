local sprite = love.graphics.newImage('sprites/finger_flower.png')
local grid = imgToGrid(sprite, 3, 1)
local animation = anim8.newAnimation(grid('1-3', 1), 0.75)

finger_flower = world:newRectangleCollider(300, 100, 50, 50, { collision_class = "flower" })
finger_flower.animation = animation

function updateFingerFlowers(dt)
  finger_flower.animation:update(dt)
end

function drawFingerFlowers(playerX, playerY)
  local x, y = finger_flower:getPosition()
  finger_flower.animation:draw(sprite, x, y, nil, 1.8, 1.8, 20, 20)
end
