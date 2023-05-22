tp @s ~ -100 ~
kill @s

#===< Effect >===
execute as @s[tag=queen_bee_rideable] run playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.5
function queen_bee:particles/bee_summon