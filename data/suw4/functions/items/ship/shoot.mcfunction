#Reset scoreboard
kill @e[type=minecraft:item,nbt={Item:{tag:{suw4:"ship_xwing"}}}]
function suw4:items/give/xwing

execute at @s[tag=ship_rider] run function suw4:raycasting/start_raycast

scoreboard players reset @s shoot_ship
