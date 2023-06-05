#Damage
scoreboard players set @s ship_damage 100
execute store result score $ship_damage ship_damage run data get entity @s SelectedItem.tag.Damage
scoreboard players operation @s ship_damage -= $ship_damage ship_damage
scoreboard players remove @s[gamemode=!creative] ship_damage 5
item modify entity @s weapon.mainhand suw4:damage