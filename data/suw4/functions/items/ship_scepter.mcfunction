#Increase ship speed
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle run scoreboard players add @s ship_speed 1
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle run scoreboard players set @s[scores={ship_speed=3..}] ship_speed 0
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle if entity @s[scores={ship_speed=0}] on passengers run title @s actionbar [{"text":"[■□□]","color":"yellow"}]
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle if entity @s[scores={ship_speed=1}] on passengers run title @s actionbar [{"text":"[■■□]","color":"yellow"}]
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle if entity @s[scores={ship_speed=2}] on passengers run title @s actionbar [{"text":"[■■■]","color":"yellow"}]

#Summon ship 
execute as @s[scores={ship_trigger=1..},tag=!ship_rider,tag=!ship_repair] unless entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] run function suw4:items/ship/mount
