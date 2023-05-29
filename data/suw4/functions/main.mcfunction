##StarShip
execute as @a at @s run function suw4:items
execute as @e at @s run function suw4:entities
execute as @a at @s run function suw4:reset

##Raycast
execute as @a[scores={shoot_ship=1..}] run function suw4:items/ship/shoot

#Reset effects
