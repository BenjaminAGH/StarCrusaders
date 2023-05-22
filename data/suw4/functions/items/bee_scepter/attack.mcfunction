function queen_bee:items/bee_scepter/damage
execute on target run tag @s add bee_scepter_target
execute rotated as @s rotated ~ 0 run summon bee ~ ~ ~ {Tags:["queen_bee_own_minion"],AngerTime:999999}
execute rotated as @s rotated ~ 0 run data modify entity @e[tag=queen_bee_own_minion,tag=!queen_bee_minion_setup,sort=nearest,limit=1] AngryAt set from entity @e[tag=bee_scepter_target,limit=1,sort=nearest]
say b
tag @e[tag=queen_bee_minion_setup] remove bee_scepter_target
tag @e[tag=bee_scepter_target] remove bee_scepter_target