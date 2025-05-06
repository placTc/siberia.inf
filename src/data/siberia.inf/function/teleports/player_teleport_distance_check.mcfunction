from ../utils/debug_say import debug_say

INTERACTABLE = "minecraft:marker"

macro in_interaction:
    execute:
        tag @p add inf.in_interaction
        debug_say("in interaction")

macro out_of_interaction:
    execute:
        tag @p remove inf.in_interaction
        debug_say("out of interaction")

execute as @a[tag=!inf.in_interaction] at @s if entity @e[type=INTERACTABLE, distance=..1, tag=inf.interactable] run in_interaction
execute as @a[tag=inf.in_interaction] at @s unless entity @e[type=INTERACTABLE, distance=..1] if entity @e[type=INTERACTABLE, tag=inf.interactable] run out_of_interaction
