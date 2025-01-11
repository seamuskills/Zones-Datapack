say "Loading datapack..."

scoreboard objectives add vars dummy

maxReadyTime = 100

# game states 0 - lobby, 1 - opening, 2 - battle, 3 - closing
scoreboard players set gameState vars 0
scoreboard players set readyUpTime vars maxReadyTime