#===< Increase ship speed >===
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle run scoreboard players add @s ship_speed 1
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle run scoreboard players set @s[scores={ship_speed=3..}] ship_speed 0
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle if entity @s[scores={ship_speed=0}] on passengers run title @s actionbar [{"text":"[■□□]","color":"yellow"}]
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle if entity @s[scores={ship_speed=1}] on passengers run title @s actionbar [{"text":"[■■□]","color":"yellow"}]
execute as @s[scores={ship_trigger=1..},tag=ship_rider] on vehicle if entity @s[scores={ship_speed=2}] on passengers run title @s actionbar [{"text":"[■■■]","color":"yellow"}]

#===< Repair >===
execute as @s[scores={ship_trigger=1..},tag=!ship_rider] if entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] store result score @s ship_got_honey run clear @s honey_bottle 0
execute as @s[scores={ship_trigger=1..,ship_got_honey=1..},tag=!ship_rider] if entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] store result score @s ship_got_honey run tag @s add ship_scepter_repair
execute as @s[scores={ship_trigger=1..},nbt={Inventory:[{Slot:-106b,id:"minecraft:honey_bottle"}]}] unless entity @s[nbt={SelectedItem:{tag:{Damage:0}}}] run tag @s add ship_scepter_repair
execute as @s[tag=ship_scepter_repair] run clear @s honey_bottle 1
execute as @s[tag=ship_scepter_repair] run function suw4:items/ship_scepter/charge

#===< Summon ship >===
execute as @s[scores={ship_trigger=1..},tag=!ship_rider,tag=!ship_scepter_repair] unless entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] run function suw4:items/ship_scepter/mount

#===< Attack >===
execute as @s[scores={ship_hit=1..},tag=!ship_rider,tag=!ship_scepter_repair] unless entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] run function suw4:items/ship_scepter/attack

#===< Reset >===
tag @s remove ship_scepter_repair
scoreboard players set @s[scores={ship_got_honey=1..}] ship_got_honey 0
