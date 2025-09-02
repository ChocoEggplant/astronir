playerStartX = 360
playerStartY = 100

world:addCollisionClass("player", {})
player = world:newRectangleCollider(playerStartX, playerStartY, 50, 60, {
  collision_class = "player"
})

player.speed = 200
player.isSprinting = false

function updatePlayer(dt)
  movePlayer(dt)
  player.animation = animations.idle
  if player.isMoving then
    -- place here different animations for different direction
    if player.direction == 'right' then
      player.animation = animations.right
    end
    if player.direction == 'left' then
      player.animation = animations.left
    end
    if player.direction == 'up' then
      player.animation = animations.up
    end
    if player.direction == 'down' then
      player.animation = animations.down
    end
  end
  player.animation:update(dt)
end

function movePlayer(dt)
  player.moveX, player.moveY = 0, 0
  player.isSprinting = love.keyboard.isDown("space")
  player.isMoving = false
  local currentSpeed = player.isSprinting and player.sprintSpeed or player.speed

  local px, py = player:getPosition()
  if love.keyboard.isDown('right') then
    player.isMoving = true
    player.direction = 'right'
    player:setX(px + player.speed * dt)
  end
  if love.keyboard.isDown('left') then
    player.isMoving = true
    player.direction = 'left'
    player:setX(px - player.speed * dt)
  end
  if love.keyboard.isDown('up') then
    player.isMoving = true
    player.direction = 'up'
    player:setY(py - player.speed * dt)
  end
  if love.keyboard.isDown('down') then
    player.isMoving = true
    player.direction = 'down'
    player:setY(py + player.speed * dt)
  end
end

function sprintPlayer()
  -- change this and make it "diagonal"
  if not player.sprinting then
    player.sprinting = true
    if player.direction == "right" then
      player:applyLinearImpulse(1000, 0)
    end
    if player.direction == "left" then
      player:applyLinearImpulse(-1000, 0)
    end
    if player.direction == "up" then
      player:applyLinearImpulse(0, -1000)
    end
    if player.direction == "down" then
      player:applyLinearImpulse(0, 1000)
    end
    player:applyLinearImpulse(0, 0)
  end
end

