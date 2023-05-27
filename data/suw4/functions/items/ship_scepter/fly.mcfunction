#===< Give bee the motion >===
execute on vehicle if entity @s[tag=ship_rideable] rotated as @a[tag=ship_rider,sort=nearest,limit=1] run function suw4:math/relative_motion

#===< Reset >===
execute unless data entity @s RootVehicle run tag @s remove ship_rider