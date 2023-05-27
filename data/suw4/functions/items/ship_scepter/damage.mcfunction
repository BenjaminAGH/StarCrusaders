#===< Damage >===
scoreboard players set @s ship_scepter_damage 100
execute store result score $ship_scepter_damage ship_scepter_damage run data get entity @s SelectedItem.tag.Damage
scoreboard players operation @s ship_scepter_damage -= $ship_scepter_damage ship_scepter_damage
scoreboard players remove @s[gamemode=!creative] ship_scepter_damage 5
item modify entity @s weapon.mainhand suw4:damage