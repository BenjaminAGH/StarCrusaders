#Xwing
execute as @s[tag=ship_rider] at @s run function suw4:items/ship/fly
execute as @s[tag=ship_rideable] at @s unless predicate suw4:has_passenger run function suw4:entities/rideable_ship/kill
execute as @e[tag=ship_rideable] run data merge entity @s {FallDistance:0f}