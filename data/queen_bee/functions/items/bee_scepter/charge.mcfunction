#===< Damage >===
scoreboard players set @s bee_scepter_damage 100
execute store result score $bee_scepter_damage bee_scepter_damage run data get entity @s SelectedItem.tag.Damage
scoreboard players operation @s bee_scepter_damage -= $bee_scepter_damage bee_scepter_damage
scoreboard players add @s bee_scepter_damage 25
item modify entity @s weapon.mainhand queen_bee:damage

playsound minecraft:item.honey_bottle.drink player @a ~ ~ ~
give @s glass_bottle 1