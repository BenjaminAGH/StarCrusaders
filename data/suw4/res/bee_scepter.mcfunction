#===< Increase bee speed >===
execute as @s[scores={bee_trigger=1..},tag=queen_bee_rider] on vehicle run scoreboard players add @s bee_speed 1
execute as @s[scores={bee_trigger=1..},tag=queen_bee_rider] on vehicle run scoreboard players set @s[scores={bee_speed=3..}] bee_speed 0
execute as @s[scores={bee_trigger=1..},tag=queen_bee_rider] on vehicle if entity @s[scores={bee_speed=0}] on passengers run title @s actionbar [{"text":"[■□□]","color":"yellow"}]
execute as @s[scores={bee_trigger=1..},tag=queen_bee_rider] on vehicle if entity @s[scores={bee_speed=1}] on passengers run title @s actionbar [{"text":"[■■□]","color":"yellow"}]
execute as @s[scores={bee_trigger=1..},tag=queen_bee_rider] on vehicle if entity @s[scores={bee_speed=2}] on passengers run title @s actionbar [{"text":"[■■■]","color":"yellow"}]

#===< Repair >===
execute as @s[scores={bee_trigger=1..},tag=!queen_bee_rider] if entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] store result score @s bee_got_honey run clear @s honey_bottle 0
execute as @s[scores={bee_trigger=1..,bee_got_honey=1..},tag=!queen_bee_rider] if entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] store result score @s bee_got_honey run tag @s add bee_scepter_repair
execute as @s[scores={bee_trigger=1..},nbt={Inventory:[{Slot:-106b,id:"minecraft:honey_bottle"}]}] unless entity @s[nbt={SelectedItem:{tag:{Damage:0}}}] run tag @s add bee_scepter_repair
execute as @s[tag=bee_scepter_repair] run clear @s honey_bottle 1
execute as @s[tag=bee_scepter_repair] run function suw4:items/bee_scepter/charge

#===< Summon Bee >===
execute as @s[scores={bee_trigger=1..},tag=!queen_bee_rider,tag=!bee_scepter_repair] unless entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] run function suw4:items/bee_scepter/mount

#===< Attack >===
execute as @s[scores={bee_hit=1..},tag=!queen_bee_rider,tag=!bee_scepter_repair] unless entity @s[nbt={SelectedItem:{tag:{Damage:100}}}] run function suw4:items/bee_scepter/attack

#===< Reset >===
tag @s remove bee_scepter_repair
scoreboard players set @s[scores={bee_got_honey=1..}] bee_got_honey 0
