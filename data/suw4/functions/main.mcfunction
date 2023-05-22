#===< Main Procedure >===
execute as @a[tag=!queen_bee_setup] at @s run function queen_bee:setup
execute as @a at @s run function queen_bee:items
execute as @e at @s run function queen_bee:entities
execute as @a at @s run function queen_bee:reset