from ../utils/debug_say import debug_say

macro perform_teleport:
    execute:
        function siberia.inf:tp_dimension with entity @n[tag=inf.teleport, distance=..0.5] data.tp
        execute store result score @p siberia.announce run data get entity @n[tag=inf.active, distance=..0.5] data.tp.announce
        schedule function siberia.inf:teleports/announce_teleport 5t append

execute at @a[predicate=siberia.inf:teleportation_ready] as @p:
    if entity @n[tag=inf.teleport_active, distance=..0.5]:
        debug_say("Teleport ready")
        tag @n[tag=inf.teleport_active, distance=..0.5] remove inf.teleport_active
        perform_teleport
    if entity @n[tag=inf.permanent_teleport, distance=..0.5]:
        debug_say("Teleport ready")
        perform_teleport