local sprite = love.graphics.newImage('sprites/unsuspicious_fungus.png')
local grid = imgToGrid(sprite, 4, 1)
local animation = anim8.newAnimation(grid('1-4', 1), 0.75)

unsuspicious_fungus = world:newRectangleCollider(200, 200, 50, 50, { collision_class = "flower" })
unsuspicious_fungus.animation = animation

function updateUnsuspiciousFungus(dt)
  unsuspicious_fungus.animation:update(dt)
end

function drawUnsuspiciousFungus(playerX, playerY)
  local x, y = unsuspicious_fungus:getPosition()
  unsuspicious_fungus.animation:draw(sprite, x, y, nil, 1.8, 1.8, 20, 20)
end
