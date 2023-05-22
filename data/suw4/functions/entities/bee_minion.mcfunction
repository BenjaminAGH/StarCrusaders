data modify entity @s AngryAt set from entity @p UUID
data merge entity @s {AngerTime:9999,HasStung:0b}

scoreboard players add @s bee_tick 1

execute as @s[scores={bee_tick=1000..}] run particle smoke ~ ~ ~ 0.3 0.3 0.3 0 100
execute as @s[scores={bee_tick=1000..}] run tp @s ~ -100 ~
execute as @s[scores={bee_tick=1000..}] run kill @s