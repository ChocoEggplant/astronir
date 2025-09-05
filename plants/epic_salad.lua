local sprite = love.graphics.newImage('sprites/epic_salad.png')
local grid = imgToGrid(sprite, 4, 1)
local animation = anim8.newAnimation(grid('1-4', 1), 0.75)

epic_salad = world:newRectangleCollider(100, 100, 50, 50, { collision_class = "flower" })
epic_salad.animation = animation

function updateEpicSalads(dt)
  epic_salad.animation:update(dt)
end

function drawEpicSalads(playerX, playerY)
  local x, y = epic_salad:getPosition()
  epic_salad.animation:draw(sprite, x, y, nil, 1.6, 1.6, 15, 17)
end
