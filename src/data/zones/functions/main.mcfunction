scoreboard players remove @a respawn 1
scoreboard players add tick vars 1 

scoreboard players set math vars 20
execute as @a:
    scoreboard players operation @s respawnSeconds = @s respawn
    scoreboard players operation @s respawnSeconds /= math vars
execute as @a[scores={respawn=1..}] run title @s actionbar [{"text":"Respawn in: ", "color":"dark_red"}, {"score":{"name": "@s", "objective": "respawnSeconds"}, "color": "dark_red"}]

execute as @a[scores={respawn=0}]:
    # respawn code
    title @s actionbar {"color":"green", "text":"Respawned!"}
    gamemode adventure @s
    summon armor_stand ~ ~ ~ {Tags:["respawn"]}
    data modify storage zones:temp spawnPos set value [0d, 0d, 0d]
    for k, v in enumerate(["SpawnX", "SpawnY", "SpawnZ"]):
        execute store result storage zones:temp spawnPos[k] double 1 run data get entity @s v
    data modify entity @e[type=armor_stand, tag=respawn, limit=1] Pos set from storage zones:temp spawnPos
    # clean up, clean up, everybody clean up!
    data remove storage zones:temp spawnPos
    tp @s @e[type=armor_stand, tag=respawn, limit=1]
    kill @e[type=armor_stand, tag=respawn]
    playsound minecraft:entity.generic.swim player @a ~ ~ ~ 1 0.6

execute as @a[scores={deathTrigger=1..}] at @s:
    # on death code
    scoreboard players set @s deathTrigger 0
    scoreboard players operation @s respawn = respawnTime config
    gamemode spectator @s