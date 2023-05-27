summon marker ~ ~ ~ {Tags:["ship_motion_a","ship_motion"]}
summon marker ^ ^ ^1 {Tags:["ship_motion_b","ship_motion"]}

data modify entity @s Rotation set from entity @p Rotation

#===< Store pos of motion A >===
execute as @e[tag=ship_motion_a,limit=1,sort=nearest] store result score @s ship_motion_x run data get entity @s Pos[0] 100
execute as @e[tag=ship_motion_a,limit=1,sort=nearest] store result score @s ship_motion_y run data get entity @s Pos[1] 100
execute as @e[tag=ship_motion_a,limit=1,sort=nearest] store result score @s ship_motion_z run data get entity @s Pos[2] 100

#===< Store pos of motion B >===
execute as @e[tag=ship_motion_b,limit=1,sort=nearest] store result score @s ship_motion_x run data get entity @s Pos[0] 100
execute as @e[tag=ship_motion_b,limit=1,sort=nearest] store result score @s ship_motion_y run data get entity @s Pos[1] 100
execute as @e[tag=ship_motion_b,limit=1,sort=nearest] store result score @s ship_motion_z run data get entity @s Pos[2] 100

#===< Calculate relative motion >===
scoreboard players operation @e[tag=ship_motion_b,limit=1,sort=nearest] ship_motion_x -= @e[tag=ship_motion_a,sort=nearest,limit=1] ship_motion_x
scoreboard players operation @e[tag=ship_motion_b,limit=1,sort=nearest] ship_motion_y -= @e[tag=ship_motion_a,sort=nearest,limit=1] ship_motion_y
scoreboard players operation @e[tag=ship_motion_b,limit=1,sort=nearest] ship_motion_z -= @e[tag=ship_motion_a,sort=nearest,limit=1] ship_motion_z

#tellraw @a {"score":{"objective":"ship_motion_x","name":"@e[tag=ship_motion_b,limit=1]"}} function

#===< Store motion in entity >===
execute as @s[scores={ship_speed=0}] store result entity @s Motion[0] double 0.002 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_x
execute as @s[scores={ship_speed=0}] store result entity @s Motion[1] double 0.002 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_y
execute as @s[scores={ship_speed=0}] store result entity @s Motion[2] double 0.002 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_z

execute as @s[scores={ship_speed=1}] store result entity @s Motion[0] double 0.004 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_x
execute as @s[scores={ship_speed=1}] store result entity @s Motion[1] double 0.004 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_y
execute as @s[scores={ship_speed=1}] store result entity @s Motion[2] double 0.004 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_z

execute as @s[scores={ship_speed=2}] store result entity @s Motion[0] double 0.008 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_x
execute as @s[scores={ship_speed=2}] store result entity @s Motion[1] double 0.008 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_y
execute as @s[scores={ship_speed=2}] store result entity @s Motion[2] double 0.008 run scoreboard players get @e[tag=ship_motion_b,sort=nearest,limit=1] ship_motion_z

kill @e[tag=ship_motion]