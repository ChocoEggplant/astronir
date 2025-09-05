world:addCollisionClass("flower", {})
require('plants/epic_salad')
require('plants/bean_sack')
require('plants/finger_flower')
require('plants/heart_attack')
require('plants/unsuspicious_fungus')

function updatePlants(dt)
  updateEpicSalads(dt)
  updateBeanSacks(dt)
  updateFingerFlowers(dt)
  updateHeartAttack(dt)
  updateUnsuspiciousFungus(dt)
end

function drawPlants(playerX, playerY)
  drawEpicSalads(playerX, playerY)
  drawBeanSacks(playerX, playerY)
  drawFingerFlowers(playerX, playerY)
  drawHeartAttack(playerX, playerY)
  drawUnsuspiciousFungus(playerX, playerY)
end
