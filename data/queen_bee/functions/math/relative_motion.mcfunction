summon marker ~ ~ ~ {Tags:["queen_bee_motion_a","queen_bee_motion"]}
summon marker ^ ^ ^1 {Tags:["queen_bee_motion_b","queen_bee_motion"]}

data modify entity @s Rotation set from entity @p Rotation

#===< Store pos of motion A >===
execute as @e[tag=queen_bee_motion_a,limit=1,sort=nearest] store result score @s bee_motion_x run data get entity @s Pos[0] 100
execute as @e[tag=queen_bee_motion_a,limit=1,sort=nearest] store result score @s bee_motion_y run data get entity @s Pos[1] 100
execute as @e[tag=queen_bee_motion_a,limit=1,sort=nearest] store result score @s bee_motion_z run data get entity @s Pos[2] 100

#===< Store pos of motion B >===
execute as @e[tag=queen_bee_motion_b,limit=1,sort=nearest] store result score @s bee_motion_x run data get entity @s Pos[0] 100
execute as @e[tag=queen_bee_motion_b,limit=1,sort=nearest] store result score @s bee_motion_y run data get entity @s Pos[1] 100
execute as @e[tag=queen_bee_motion_b,limit=1,sort=nearest] store result score @s bee_motion_z run data get entity @s Pos[2] 100

#===< Calculate relative motion >===
scoreboard players operation @e[tag=queen_bee_motion_b,limit=1,sort=nearest] bee_motion_x -= @e[tag=queen_bee_motion_a,sort=nearest,limit=1] bee_motion_x
scoreboard players operation @e[tag=queen_bee_motion_b,limit=1,sort=nearest] bee_motion_y -= @e[tag=queen_bee_motion_a,sort=nearest,limit=1] bee_motion_y
scoreboard players operation @e[tag=queen_bee_motion_b,limit=1,sort=nearest] bee_motion_z -= @e[tag=queen_bee_motion_a,sort=nearest,limit=1] bee_motion_z

#tellraw @a {"score":{"objective":"bee_motion_x","name":"@e[tag=queen_bee_motion_b,limit=1]"}}

#===< Store motion in entity >===
execute as @s[scores={bee_speed=0}] store result entity @s Motion[0] double 0.002 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_x
execute as @s[scores={bee_speed=0}] store result entity @s Motion[1] double 0.002 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_y
execute as @s[scores={bee_speed=0}] store result entity @s Motion[2] double 0.002 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_z

execute as @s[scores={bee_speed=1}] store result entity @s Motion[0] double 0.004 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_x
execute as @s[scores={bee_speed=1}] store result entity @s Motion[1] double 0.004 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_y
execute as @s[scores={bee_speed=1}] store result entity @s Motion[2] double 0.004 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_z

execute as @s[scores={bee_speed=2}] store result entity @s Motion[0] double 0.008 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_x
execute as @s[scores={bee_speed=2}] store result entity @s Motion[1] double 0.008 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_y
execute as @s[scores={bee_speed=2}] store result entity @s Motion[2] double 0.008 run scoreboard players get @e[tag=queen_bee_motion_b,sort=nearest,limit=1] bee_motion_z

kill @e[tag=queen_bee_motion]