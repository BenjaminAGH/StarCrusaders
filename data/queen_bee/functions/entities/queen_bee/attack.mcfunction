scoreboard players set @s bee_rand 0
execute if predicate queen_bee:binary_rand run scoreboard players add @s bee_rand 1
execute if predicate queen_bee:binary_rand run scoreboard players add @s bee_rand 2
execute if predicate queen_bee:binary_rand run scoreboard players add @s bee_rand 4

execute as @s[scores={bee_rand=0..4}] run function queen_bee:entities/queen_bee/attacks/shoot
execute as @s[scores={bee_rand=5..6}] run function queen_bee:entities/queen_bee/attacks/charge
execute as @s[scores={bee_rand=7..}] run function queen_bee:summon/bee_minion