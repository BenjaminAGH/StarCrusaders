tag @s remove queen_bee_floating
tag @s add queen_bee_charge
scoreboard players set @s bee_tick 0
data modify entity @e[tag=queen_bee_queen_model,sort=nearest,limit=1,distance=..1] ArmorItems[3].tag.CustomModelData set value 230101

#===< Store pos of Queen bee >===
execute as @s store result score @s bee_motion_x run data get entity @s Pos[0] 100
execute as @s store result score @s bee_motion_y run data get entity @s Pos[1] 100
execute as @s store result score @s bee_motion_z run data get entity @s Pos[2] 100

#===< Store pos of target >===
execute as @p[gamemode=!creative,gamemode=!spectator] store result score @s bee_motion_x run data get entity @s Pos[0] 100
execute as @p[gamemode=!creative,gamemode=!spectator] store result score @s bee_motion_y run data get entity @s Pos[1] 100
execute as @p[gamemode=!creative,gamemode=!spectator] run scoreboard players add @s bee_motion_y 100
execute as @p[gamemode=!creative,gamemode=!spectator] store result score @s bee_motion_z run data get entity @s Pos[2] 100

#===< Calculate relative motion >===
scoreboard players operation @p[gamemode=!creative,gamemode=!spectator] bee_motion_x -= @s bee_motion_x
scoreboard players operation @p[gamemode=!creative,gamemode=!spectator] bee_motion_y -= @s bee_motion_y
scoreboard players operation @p[gamemode=!creative,gamemode=!spectator] bee_motion_z -= @s bee_motion_z

#===< Store motion in entity >===
execute as @s store result entity @s Motion[0] double 0.003 run scoreboard players get @p[gamemode=!creative,gamemode=!spectator] bee_motion_x
execute as @s store result entity @s Motion[1] double 0.003 run scoreboard players get @p[gamemode=!creative,gamemode=!spectator] bee_motion_y
execute as @s store result entity @s Motion[2] double 0.003 run scoreboard players get @p[gamemode=!creative,gamemode=!spectator] bee_motion_z