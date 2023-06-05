# Detect Headshots/bodyshots/legshots
execute positioned ~ ~0.35 ~ unless entity @s[dx=0] positioned ~ ~-0.3 ~ run say headshot

execute positioned ~ ~0.35 ~ if entity @s[dx=0] positioned ~ ~-2.3 ~ if entity @s[dx=0] run say chest shot

execute positioned ~ ~-1.95 ~ unless entity @s[dx=0] run say leg shot

say I have been hit by a raycast. oof
particle explosion ~ ~ ~ 0 0 0 0 5
damage @s[tag=!ship_rider] 10 minecraft:arrow

#Max out range to end the raycast
scoreboard players set .distance shoot_dis 1000

