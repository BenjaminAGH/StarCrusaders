
#===< Iterate >===
scoreboard players add @s bee_tick 1
tp @s ^ ^ ^.5
particle dust 0.945 0.647 0 0.8 ~ ~ ~ 0 0 0 0 0

#===< Damage >===
execute positioned ~-.5 ~-.5 ~-.5 as @e[type=!bee,type=!armor_stand,dx=0,dy=0,dz=0] run effect give @s instant_damage 1 0
execute positioned ~-.5 ~-.5 ~-.5 as @e[type=!bee,type=!armor_stand,dx=0,dy=0,dz=0] run scoreboard players add @s bee_honey_effect 100

kill @s[scores={bee_tick=200..}]