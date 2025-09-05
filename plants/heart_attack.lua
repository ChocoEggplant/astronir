local sprite = love.graphics.newImage('sprites/heart_attack.png')
local grid = imgToGrid(sprite, 4, 1)
local animation = anim8.newAnimation(grid('1-4', 1), 0.75)

heart_attack = world:newRectangleCollider(100, 200, 50, 50, { collision_class = "flower" })
heart_attack.animation = animation

function updateHeartAttack(dt)
  heart_attack.animation:update(dt)
end

function drawHeartAttack(playerX, playerY)
  local x, y = heart_attack:getPosition()
  heart_attack.animation:draw(sprite, x, y, nil, 1.8, 1.8, 15, 20)
end
