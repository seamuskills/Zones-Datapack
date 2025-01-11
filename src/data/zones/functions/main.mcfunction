scoreboard players remove @a respawn 1
scoreboard players add tick vars 1 

execute as @a[scores={respawn=1..}] run title @s actionbar [{"text":"Respawn in: "}, {"score":{"name": "@s", "objective": "respawn"}}]

execute as @a[scores={respawn=0}]:
    #respawn code
    title @s actionbar {"color":"green", "text":"Respawned!"}
    gamemode adventure @s
    summon armor_stand ~ ~ ~ {Tags:["respawn"]}
    for k, v in enumerate(["SpawnX", "SpawnY", "SpawnZ"]):
        execute store result entity @e[type=armor_stand, limit=1, tag=respawn] Pos[k] double 1 run data get entity @s v
    tp @s @e[type=armor_stand, tag=respawn, limit=1]
    kill @e[type=armor_stand, tag=respawn]
    playsound minecraft:entity.generic.swim player @a ~ ~ ~ 1 0.6

execute as @a[scores={deathTrigger=1..}] at @s:
    scoreboard players set @s deathTrigger 0
    scoreboard players operation @s respawn = respawnTime config
    gamemode spectator @s