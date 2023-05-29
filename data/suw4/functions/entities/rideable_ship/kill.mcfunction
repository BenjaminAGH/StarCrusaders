tp @s ~ -100 ~
kill @s

effect clear @p[limit=1] 
execute as @s[tag=ship_rideable] run playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.5
function suw4:particles/ship_summon