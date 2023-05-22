#===< Make player the rider >===
tag @s add queen_bee_rider
function suw4:items/bee_scepter/damage

#===< Effect >===
playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.5
function suw4:particles/bee_summon

#===< Summon Rideable Bee >===
summon armor_stand ~ ~ ~ {Small:1b,Invisible:1b,Tags:["queen_bee_rideable"],ArmorItems:[{},{},{},{id:"minecraft:netherite_sword",Count:1b,tag:{CustomModelData:1}}]}
scoreboard players add @e[tag=queen_bee_rideable] bee_speed 0
ride @s mount @e[tag=queen_bee_rideable,sort=nearest,limit=1]