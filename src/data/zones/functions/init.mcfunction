tellraw @a "Loading datapack..."

scoreboard objectives add vars dummy
scoreboard objectives add alphaTeam dummy
scoreboard objectives add bravoTeam dummy
scoreboard objectives add respawn dummy

maxReadyTime = 100

# game states 0 - lobby, 1 - opening, 2 - battle, 3 - closing
scoreboard players set gameState vars 0
scoreboard players set readyUpTime vars maxReadyTime
scoreboard players set score alphaTeam 100
scoreboard players set penalty alphaTeam 0
scoreboard players set score bravoTeam 100
scoreboard players set penalty bravoTeam 0

tellraw @a "Loading complete!"