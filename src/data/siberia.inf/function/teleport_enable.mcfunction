ACTIVATOR = "minecraft:glowstone_dust"

execute as @e[tag=inf.teleport] at @s:
    if entity @e[type=item, nbt={Item: {id: ACTIVATOR}}, distance=..0.5] unless entity @s[tag=inf.teleport_active]:
        tag @s add inf.teleport_active
        kill @e[type=item, nbt={Item: {id: ACTIVATOR}}, distance=..0.5]