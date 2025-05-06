from ../utils/debug_say import debug_say

ACTIVATOR = "minecraft:glowstone_dust"

execute as @e[tag=inf.teleport] at @s:
    if entity @s[tag=!inf.permanent_teleport]:
        if entity @e[type=item, nbt={Item: {id: ACTIVATOR}}, distance=..0.5] unless entity @s[tag=inf.teleport_active]:
            debug_say("Activating teleport marker")
            tag @s add inf.teleport_active
            kill @e[type=item, nbt={Item: {id: ACTIVATOR}}, distance=..0.5]