Menu = true
local play_sprite = love.graphics.newImage('sprites/play.png')
local exit_sprite = love.graphics.newImage('sprites/exit.png')
local grid = imgToGrid(play_sprite, 1, 1)
local animations = {
  menu = anim8.newAnimation(grid('1-1', 1), 0.3),
  exit = anim8.newAnimation(grid('1-1', 1), 0.3),
}

PlayPosX = play_sprite:getWidth()
PlayPosY = 50
Play_magnitude = 2
local playHeight = play_sprite:getHeight() * Play_magnitude
local playWidht = play_sprite:getWidth() * Play_magnitude
world:addCollisionClass("play", {})
menu_component = world:newRectangleCollider(PlayPosX, PlayPosY, playWidht, playHeight, {
  collision_class = "play"
})
menu_component:setType('static')
menu_component.animation = animations.menu

Exit_magnitude = 4
ExitPosY = (WindowHeight - exit_sprite:getHeight() * Exit_magnitude)
PosY = WindowHeight * 4 / 5
Door = 130
Exit = world:newRectangleCollider(0, PosY, (WindowWidth / 2) - Door, 500)
Exit2 = world:newRectangleCollider(WindowWidth / 2 + Door, PosY, WindowWidth / 2, 500)
Exit:setType('static')
Exit2:setType('static')
Exit.animation = animations.exit

function drawMenu(playerX, playerY)
  menu_component.animation:draw(play_sprite, PlayPosX, PlayPosY, nil, Play_magnitude)
  Exit.animation:draw(exit_sprite, 0, ExitPosY, nil, Exit_magnitude)
end
