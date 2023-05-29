#Run from tf_raycast:start_raycast

# Using dx for precise hitbox detection
# Parameters:
#     Edit not_mob.json in tags/entities to change which entities will not be targetted
#     Change the "positioned" offsets to change projectile size
#       - If > 1 block, just use one dx detection
execute as @e[tag=!raycasting,type=!#suw4:not_mob,dx=0] positioned ~-1 ~-1 ~-1 if entity @s[dx=1,dz=1,dy=1] positioned ~0.99 ~0.99 ~0.99 run function suw4:raycasting/collide

scoreboard players add .distance shoot_dis 1

# Make raycast visible
particle minecraft:small_flame ~ ~ ~ 0 0 0 0 0
playsound minecraft:item.trident.throw player @s

# Repeat the raycast if certain conditions are met
# Parameters:
#    (score after "matches") * (accuracy increment) = range
#    The "positioned" value specifies the precision
#    Edit raycast_pass.json in tags/blocks to change which blocks the raycast ignores
#    "rotated" controls arc/curve of raycast path
execute if score .distance shoot_dis matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #suw4:raycast_pass run function suw4:raycasting/raycast
