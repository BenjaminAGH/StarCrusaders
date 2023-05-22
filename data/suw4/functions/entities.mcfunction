#===< Queen Bee >===
execute as @s[type=bee,tag=queen_bee_queen] at @s run function queen_bee:entities/queen_bee
execute as @s[tag=queen_bee_queen_model,tag=!queen_bee_exists] run function queen_bee:summon/win
execute as @s[tag=queen_bee_queen_model,tag=!queen_bee_exists] run kill @s
execute as @s[tag=queen_bee_queen_model,tag=queen_bee_exists] run tag @s remove queen_bee_exists
execute as @s[scores={bee_honey_effect=1..}] run function queen_bee:entities/honey_effect

#===< Bee Minion >===
execute as @s[tag=queen_bee_minion] run function queen_bee:entities/bee_minion
execute as @s[tag=queen_bee_own_minion,nbt={HasStung:1b}] run function queen_bee:entities/rideable_bee/kill 

#===< Larva >===
execute as @s[tag=queen_bee_larva] run function queen_bee:entities/larva

#===< Bossbar >===
execute as @s[type=player] if entity @e[tag=queen_bee_queen,distance=..64] run bossbar set queen_bee:queen_bee players @s
execute as @s[type=player] unless entity @e[tag=queen_bee_queen,distance=..64] run bossbar set queen_bee:queen_bee players

#===< Projectiles >===
execute as @s[tag=queen_bee_shot] at @s run function queen_bee:entities/honey_shot

#===< Bee riding >===
execute as @s[tag=queen_bee_rider] at @s run function queen_bee:items/bee_scepter/fly
execute as @s[tag=queen_bee_rideable] at @s unless predicate queen_bee:has_passenger run function queen_bee:entities/rideable_bee/kill