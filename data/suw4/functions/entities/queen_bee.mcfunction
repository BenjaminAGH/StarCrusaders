#===< Model >===
effect give @s invisibility 999999 0 true
tp @e[tag=queen_bee_queen_model,sort=nearest,limit=1] ~ ~ ~ ~ ~
tag @e[tag=queen_bee_queen_model,sort=nearest,limit=1,distance=..1] add queen_bee_exists

#===< Health >===
execute store result score @s bee_health run data get entity @s Health
execute store result bossbar queen_bee:queen_bee value run scoreboard players get @s bee_health

#===< AngryAt >===
data modify entity @s AngryAt set from entity @p UUID
data merge entity @s {AngerTime:9999,HasStung:0b}

#===< HurtTime >===
execute store result score @s bee_hurt run data get entity @s HurtTime
execute as @s[scores={bee_hurt=5..}] run data modify entity @e[tag=queen_bee_queen_model,sort=nearest,limit=1,distance=..1] ArmorItems[3].tag.CustomModelData set value 230102
execute as @s[tag=!queen_bee_charge,scores={bee_hurt=..4}] run data modify entity @e[tag=queen_bee_queen_model,sort=nearest,limit=1,distance=..1] ArmorItems[3].tag.CustomModelData set value 230100

#===< AI >===
scoreboard players add @s bee_tick 1
execute as @s[tag=queen_bee_floating] unless entity @s[nbt={NoAI:1b}] run data merge entity @s {NoAI:1b}
execute as @s[tag=!queen_bee_floating] unless entity @s[nbt={NoAI:0b}] run data merge entity @s {NoAI:0b}
execute as @s[tag=queen_bee_floating] run function queen_bee:entities/queen_bee/float
execute unless block ~ ~-.2 ~ #queen_bee:nonsolid run data modify entity @s Motion[1] set value 0.1d

#===< Attack Loop >===
execute as @s[tag=queen_bee_floating,scores={bee_tick=80..}] run function queen_bee:entities/queen_bee/attack
execute as @s[tag=queen_bee_floating,scores={bee_tick=80..}] run scoreboard players set @s bee_tick 0

#===< Reset Charge Model >===
execute as @s[tag=queen_bee_charge,scores={bee_tick=40..}] run data modify entity @e[tag=queen_bee_queen_model,sort=nearest,limit=1,distance=..1] ArmorItems[3].tag.CustomModelData set value 230100
execute as @s[tag=queen_bee_charge,scores={bee_tick=40..}] run tag @s remove queen_bee_charge

#===< Charge >===
execute as @s[tag=queen_bee_charge] positioned ~-1 ~-1 ~-1 as @e[type=!bee,dx=0,dy=0,dz=0] run effect give @s instant_damage

#===< Normal Entity Control >===
execute as @s[scores={bee_tick=400..}] if entity @a[distance=..64,gamemode=!creative,gamemode=!spectator] run tag @s add queen_bee_floating
execute as @s[scores={bee_tick=400..},tag=queen_bee_floating] run function queen_bee:summon/bee_minion
execute as @s[scores={bee_tick=400..}] run scoreboard players set @s bee_tick 0