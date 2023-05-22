#===< Give bee the motion >===
execute on vehicle if entity @s[tag=queen_bee_rideable] rotated as @a[tag=queen_bee_rider,sort=nearest,limit=1] run function queen_bee:math/relative_motion

#===< Reset >===
execute unless data entity @s RootVehicle run tag @s remove queen_bee_rider